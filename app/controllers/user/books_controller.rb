class User::BooksController < UserController

  def index
    @books = Book.order(id: :desc)
  end

  def show
     @books = Book.find(params[:id])
  end
end
