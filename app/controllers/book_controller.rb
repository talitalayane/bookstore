class BookController < ApplicationController
before_action :set_book, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(form_params)
  end

  def edit
  end

  def update
    params = form_params.to_h
    @book.update(params)
  end

  def destroy
    @book.destroy
    redirect_to admin_book_index_path
  end

  private

  def form_params
    params.require(:book).permit(:name, :author, :category)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end
