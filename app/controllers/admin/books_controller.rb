class Admin::BooksController < AdminController
  before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.order(id: :desc)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(form_params)

    if @book.save
      redirect_to new_admin_book_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    params = form_params.to_h

    if @book.update(params)
      redirect_to admin_books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to admin_books_path
  end

  private

  def form_params
    params.require(:book).permit(:name, :author, :category)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
