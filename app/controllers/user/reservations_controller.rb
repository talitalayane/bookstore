class User::ReservationsController < UserController
  before_action :set_reservation, only: [:edit, :update]

  def index
    @reservations = current_user.reservations.all
  end

  def new
    @reservation = Reservation.new(user: current_user)
  end

  def create
    reservation_attributes = reservation_params
    book_id = reservation_attributes[:book_id].to_i

    book = Book.lock.find_by(id: book_id)
    unless book
      @reservation = Reservation.new
      @reservation.errors.add(:base, "Livro não encontrado")
      render :new and return
    end

    if book.stock.to_i <= 0
      @reservation = Reservation.new
      @reservation.errors.add(:base, "Livro sem estoque disponível")
      render :new and return
    end

    created = false
    ActiveRecord::Base.transaction do
      book.decrement!(:stock)
      @reservation = Reservation.new(
        book_id: book.id.to_s,
        user_id: current_user.id.to_s,
        status: true
      )

      if @reservation.save
        created = true
      else
        raise ActiveRecord::Rollback
      end
    end

    if created
      redirect_to user_reservations_path
    else
      render :new
    end
  end

  def edit; end


  def update
    ActiveRecord::Base.transaction do
      @reservation = Reservation.update( :status => false )
      redirect_to user_reservations_path
    end
  end

  private

  def form_params
    params.require(:reservation).permit(:book_id, :status)
  end

  def reservation_params
    form_params
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end
end
