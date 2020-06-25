class EventVideosController < ApplicationController
  before_action :set_event_video, only: [:show, :edit, :update, :destroy]

  # GET /event_videos
  # GET /event_videos.json
  def index
    @event_videos = EventVideo.all
  end

  # GET /event_videos/1
  # GET /event_videos/1.json
  def show
  end

  # GET /event_videos/new
  def new
    @event_video = EventVideo.new
    @idd = params[:event_id]
  end

  # GET /event_videos/1/edit
  def edit
  end



  # POST /event_videos
  # POST /event_videos.json
  def create
    @event_video = EventVideo.new(event_video_params)
    @event_video.event_id = params[:event_id]
    @event = Event.where(id:params[:event_id]).first
    respond_to do |format|
      if @event_video.save
        format.html { redirect_to @event, notice: 'Event video was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_videos/1
  # PATCH/PUT /event_videos/1.json
  def update
    respond_to do |format|
      if @event_video.update(event_video_params)
        format.html { redirect_to @event_video, notice: 'Event video was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_video }
      else
        format.html { render :edit }
        format.json { render json: @event_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_videos/1
  # DELETE /event_videos/1.json
  def destroy
    @event_video.destroy
    respond_to do |format|
      format.html { redirect_to event_videos_url, notice: 'Event video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_video
      @event_video = EventVideo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_video_params
      params.fetch(:event_video, {}).permit(:event_id,:content)
    end
end
