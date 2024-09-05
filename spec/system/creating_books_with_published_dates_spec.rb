require 'rails_helper'
require 'date'

RSpec.describe "CreatingBooksWithPublishedDates", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'book_title', with: 'test book 1'
    fill_in 'book_published_date', with: Date.today
    click_on 'Create Book'
    expect(page).to have_content('test book 1')
    expect(page).to have_content(Date.today.strftime("%m/%d/%Y"))
    book = Book.order("id").last
    expect(book.title).to eq('test book 1')
    expect(book.published_date).to eq(Date.today)
  end
end
