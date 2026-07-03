require 'rails_helper'

RSpec.describe Book, type: :model do
  it "book is valid" do
    book = Book.new(name: "O dia do Coringa", author: "Jostein Gaarder", category: "Romance", stock: 3)

    expect(book.name).to eql "O dia do Coringa"
    expect(book.author).to eql "Jostein Gaarder"
    expect(book.category).to eql "Romance"
    expect(book).to be_valid
  end

  it "Book is not valid" do
    book = Book.new(name: "", author: "Jostein Gaarder", category: "Filosofia", stock: 1)

    expect(book).to_not be_valid
  end

  it "stock must be integer and >= 0" do
    book = Book.new(name: "Teste", author: "Autor", category: "G", stock: -1)
    expect(book).to_not be_valid
  end

  it "requires a predefined category" do
    book = Book.new(name: "Teste", author: "Autor", category: nil, stock: 1)
    expect(book).to_not be_valid
  end

  it "does not allow categories outside the predefined list" do
    book = Book.new(name: "Teste", author: "Autor", category: "Categoria livre", stock: 1)
    expect(book).to_not be_valid
  end
end
