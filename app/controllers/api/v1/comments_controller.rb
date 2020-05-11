class API::V1::CommentsController < APIController
  before_action :set_comment, only: [:show]
  # GET /api/v1/comments
  def index
    @eidc =Comment.select(:event_id)
    @miev = Event.where(id:@eidc)
    @comments = Comment.where(event_id:params[:event_id])
    render json: @comments
  end
  # GET /api/v1/comments/:id
  def show
    @comment = Comment.where(id: params[:id])
    render json: @comment
  end
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
