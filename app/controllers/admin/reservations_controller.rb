class Admin::ReservationsController < AdminController
  before_action :set_reservation, only: [:edit, :update]

  def index
    @reservations = Reservation.order(id: :desc)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    ActiveRecord::Base.transaction do
      @reservation = Reservation.new( :book_id => form_params[:book_id],
                                      :user_id => form_params[:user_id],
                                      :status => true )
      if @reservation.save
        redirect_to admin_reservations_path
      else
        render :new
      end
    end
  end

  def show
  end

  def edit
  end

  def update
    ActiveRecord::Base.transaction do
      @reservation = Reservation.update( :status => true )
      redirect_to admin_reservations_path
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
