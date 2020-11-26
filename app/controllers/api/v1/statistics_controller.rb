class Api::V1::StatisticsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_statistic, only: [ :show, :update ]

  def index
    @statistics = policy_scope(Statistic)
  end

  def update
    if @statistic.update(statistic_params)
      # render :show
    else
      render_error
    end
  end

  def create
    @statistic = Statistic.new(statistic_params)
    @statistic.user_id = current_user.id
    @part = Part.find(params[:part_id])
    @statistic.part = @part
    authorize @statistic
    if @statistic.save
      render :index, status: :created
    else
      render_error
    end
  end

  private

  def set_statistic
    @statistic = Statistic.find(params[:id])
    authorize @statistic  # For Pundit
  end

  def statistic_params
    params.require(:statistic).permit(:unitprice, :unitofmeas, :attritioncoap, :attritionplanned, :attritioncoad, :part_id)
  end

  def render_error
    render json: { errors: @statistic.errors.full_messages },
      status: :unprocessable_entity
  end
end
