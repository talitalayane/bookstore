class Admin::ReservationsController < AdminController
  before_action :set_reservation, only: [:edit, :update]

  def index
    @reservations = Reservation.order(id: :desc)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    book_id = form_params[:book_id].to_i
    book = Book.lock.find_by(id: book_id)

    @reservation = Reservation.new
    unless book
      @reservation.errors.add(:base, "Livro não encontrado")
      render :new and return
    end

    if book.stock.to_i <= 0
      @reservation.errors.add(:base, "Livro sem estoque disponível")
      render :new and return
    end

    created = false
    ActiveRecord::Base.transaction do
      book.decrement!(:stock)
      @reservation = Reservation.new(book_id: book.id.to_s,
                                      user_id: form_params[:user_id],
                                      status: true)
      if @reservation.save
        created = true
      else
        raise ActiveRecord::Rollback
      end
    end

    if created
      redirect_to admin_reservations_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    # if changing status from true to false, increment the book stock
    will_set_status = ActiveModel::Type::Boolean.new.cast(form_params[:status])
    ActiveRecord::Base.transaction do
      if will_set_status == false && @reservation.status == true
        book = Book.find(@reservation.book_id)
        book.increment!(:stock)
      end

      if @reservation.update(form_params)
        redirect_to admin_reservations_path
      else
        raise ActiveRecord::Rollback
        render :edit
      end
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
