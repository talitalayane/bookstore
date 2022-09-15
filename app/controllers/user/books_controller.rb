class User::BooksController < UserController

  def index
    @books = Book.order(id: :desc)
    if params[:query].present?
      @books = Book.global_search(params[:query])
    end
  end

  def show
     @books = Book.find(params[:id])
  end
end
