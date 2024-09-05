require 'rails_helper'
require 'date'

RSpec.describe Book, type: :model do
  
  it "is valid with only a title" do 
    book = Book.new(title: "test")
    expect(book).to be_valid
  end

  it "is invalid without a title" do
    book = Book.new(title: nil)
    expect(book).not_to be_valid 
  end

  it "can have an author" do 
    book = Book.new(author: "Waldo")
    expect(book.author).to eq("Waldo")
  end

  it "can have price" do 
    book = Book.new(price: 5.00)
    expect(book.price).to eq(5.00)
  end

  it "can have a published-date" do 
    book = Book.new(published_date: Date.today)
    expect(book.published_date).to eq(Date.today)
  end

end
