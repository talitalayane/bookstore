require 'rails_helper'

RSpec.describe Admin::BooksController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_admin).and_return(true)
    allow(controller).to receive(:current_admin).and_return(Admin.new(id: 1, name: 'Admin'))
  end

  describe 'POST #create' do
    it 'does not create a book without a category' do
      post :create, params: { book: { name: 'Novo Livro', author: 'Autor', stock: 2, category: nil } }

      expect(response.status).to eq(200)
      book = controller.instance_variable_get(:@book)
      expect(book.errors[:category]).to include("can't be blank")
    end
  end

  describe 'PATCH #update' do
    it 'updates the stock attribute' do
      book = Book.create!(name: 'Teste', author: 'Autor', category: 'Romance', stock: 0)

      patch :update, params: { id: book.id, book: { stock: 5 } }

      expect(response).to redirect_to(admin_books_path)
      expect(book.reload.stock).to eq(5)
    end
  end
end
