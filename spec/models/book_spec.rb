require 'rails_helper'

RSpec.describe Book, type: :model do
  it "book is valid" do
    book = Book.new(name: "O dia do Coringa", author: "Jostein Gaarder", category: "Filosofia")

    expect(book.name).to eql "O dia do Coringa"
    expect(book.author).to eql "Jostein Gaarder"
    expect(book.category).to eql "Filosofia"
    expect(book).to be_valid
  end

  it "Book is not valid" do
    book = Book.new(name: "", author: "Jostein Gaarder", category: "Filosofia")

    expect(book).to_not be_valid
  end
end
