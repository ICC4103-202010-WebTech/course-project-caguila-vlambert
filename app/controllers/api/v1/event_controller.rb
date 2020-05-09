class API::V1::EventController < APIController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  #GET /api/v1/Event
  def index
    @events = Event.all


  end
  #GET /api/v1/Event
  def show

  end
  def create
    @events = Event.new (event_params)
  end
  def update


  end
end
