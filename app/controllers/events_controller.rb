class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end
  def search
    @parametro = params[:q]
    @events =Event.where("description like ?", "%#{params[:q]}%")
  end
  def searchcreator
    @creator = User.where("name like ?", "%#{params[:q]}%").first
    @events =Event.where(user_id:@creator.id)
    @parametro = @creator.name
  end
  def searchorg
    @creator = Organization.where("name like ?", "%#{params[:q]}%").first
    @events =Event.where(organization_id:@creator.id)
    @parametro = @creator.name
  end
  # GET /events/1
  # GET /events/1.json
  def show
  end
def reportcoment
  u = User.where(admin:true)
  eventt = Comment.where(id:params[:id]).first
  sentence = "The user # "
  sentence.concat(current_user.id.to_s)
  sentence.concat(" reported the coment with the following content ")
  sentence.concat(eventt.content.to_s)
  u.each do |user|
    i = Message.new()
    i.target_id = user.id
    i.content = sentence
    i.seen = false
    i.save
  end
  respond_to do |format|
    format.html { redirect_to root_path, notice: 'Comment repoted' }
  end
end
  def report
    if current_user
        u = User.where(admin:true)
        eventt = Event.where(id:params[:id]).first
        sentence = "The User #"
        sentence.concat(current_user.id.to_s)
        sentence.concat(" reported the event ")
        sentence.concat(eventt.description.to_s)
        u.each do |user|
          i = Message.new()
          i.target_id = user.id
          i.content = sentence
          i.seen = false
          i.save
        end
        respond_to do |format|
          format.html { redirect_to eventt, notice: 'Report Created' }
        
      end
    end
  end

  # GET /events/new
  def new
    @event = Event.new
    5.times{@event}
  end

  # GET /events/1/edit
  def edit
    5.times{@event.images.build}
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.fetch(:event, {}).permit(:place, :description, :user_id, :organization_id, :public, :is_org,:images_attributes => [:event_id],:event_files_attributes => [:event_id],:event_videos_attributes => [:event_id])
    end
end
