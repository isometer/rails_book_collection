require 'rails_helper'

RSpec.describe "CreatingBooksWithPrices", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'book_title', with: 'test book 1'
    fill_in 'book_price', with: '5.00'
    click_on 'Create Book'
    expect(page).to have_content('test book 1')
    expect(page).to have_content('5.00')
    book = Book.order("id").last
    expect(book.title).to eq('test book 1')
    expect(book.price).to eq(5.00)
  end
end
