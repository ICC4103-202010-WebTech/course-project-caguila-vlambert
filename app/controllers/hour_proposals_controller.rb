class HourProposalsController < ApplicationController
  before_action :set_hour_proposal, only: [:show, :edit, :update, :destroy]

  # GET /hour_proposals
  # GET /hour_proposals.json
  def index
    @hour_proposals = HourProposal.all
  end

  # GET /hour_proposals/1
  # GET /hour_proposals/1.json
  def show
  end

  # GET /hour_proposals/new
  def new
    @hour_proposal = HourProposal.new
    @idd = params[:event_id]
    @usr_idd = params[:user_id]
  end

  # GET /hour_proposals/1/edit
  def edit
    @idd = params[:event_id]
    @usr_idd = params[:user_id]
  end
  def voting
    te = HourProposal.where(id:params[:id]).first

    te.count = te.count + 1
    te.save!
    @event = Event.where(id:te.event_id).first
    respond_to do |format|
      format.html { redirect_to @event}
      format.json { render :show, status: :created, location: @event }
    end
  end

  # POST /hour_proposals
  # POST /hour_proposals.json
  def create
    @hour_proposal = HourProposal.new(hour_proposal_params)
    @hour_proposal.event_id = params[:event_id]
    @hour_proposal.user_id = params[:user_id]
    @event = Event.where(id:params[:event_id]).first
    respond_to do |format|
      if @hour_proposal.save
        format.html { redirect_to @event}
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @hour_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hour_proposals/1
  # PATCH/PUT /hour_proposals/1.json
  def update
    @event = Event.where(id:params[:event_id]).first
    respond_to do |format|
      if @hour_proposal.update(hour_proposal_params)
        format.html { redirect_to @event}
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @hour_proposal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hour_proposals/1
  # DELETE /hour_proposals/1.json
  def destroy
    @hour_proposal.destroy
    respond_to do |format|
      format.html { redirect_to hour_proposals_url, notice: 'Hour proposal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour_proposal
      @hour_proposal = HourProposal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hour_proposal_params
      params.fetch(:hour_proposal, {}).permit(:event_id,:user_id,:vote)
    end
end
