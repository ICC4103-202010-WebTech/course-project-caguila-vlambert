class API::V1::EventsController < APIController
  before_action :set_event, only: [:show]
  # GET /api/v1/events
  def index

    @events = Event.all
    render json: @events
  end
  # GET /api/v1/events/:id
  def show
    @event = Event.where(id: params[:id])

    render json: @event
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

end