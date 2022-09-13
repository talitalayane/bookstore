class User::BooksController < UserController

  def index
    @books = Book.order(id: :desc)
  end
end
