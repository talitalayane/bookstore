class User::BooksController < AdminController

  def index
    @books = Book.order(id: :desc)
  end
end
