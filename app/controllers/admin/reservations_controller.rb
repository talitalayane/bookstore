class Admin::ReservationsController < AdminController
  before_action :set_reservation, only: [:edit, :update]

  def index
    @reservations = Reservation.order(id: :desc)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(form_params)

    if @reservation.save
      redirect_to admin_reservations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    params = form_params.to_h

    if @reservation.update(params)
      redirect_to admin_reservations_path
    else
      render :edit
    end
  end

  private

  def form_params
    params.require(:reservation).permit(:status, :user_id, :book_id)
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
