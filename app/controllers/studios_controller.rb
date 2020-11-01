class StudiosController
  STEP = 5.freeze

  def index
    page = params[:page]

    data = DataLoader.data[page*STEP..page*STEP+STEP-1]

    render json: { data: data }, status: :ok
  end

  def show
    data = StudioBookingTime.call

    render json: { data: data }, status: :ok
  end
end