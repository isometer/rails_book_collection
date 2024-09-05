require 'rails_helper'

RSpec.describe "CreatingBooksWithAuthors", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'book_title', with: 'test book 1'
    fill_in 'book_author', with: 'Waldo'
    click_on 'Create Book'
    expect(page).to have_content('test book 1')
    expect(page).to have_content('Waldo')
    book = Book.order("id").last
    expect(book.title).to eq('test book 1')
    expect(book.author).to eq('Waldo')
  end

end