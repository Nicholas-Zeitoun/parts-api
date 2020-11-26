class Api::V1::PartsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_part, only: [ :show, :update ]

  def index
    @parts = policy_scope(Part)
  end

  def show
  end

  def create
    @part = Part.new(part_params)
    @part.user = current_user
    authorize @part
    if @part.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @part.update(part_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_part
    @part = Part.find(params[:id])
    authorize @part  # For Pundit
  end

  def part_params
    params.require(:part).permit(:partroot, :description)
  end

  def render_error
    render json: { errors: @part.errors.full_messages },
      status: :unprocessable_entity
  end
end
