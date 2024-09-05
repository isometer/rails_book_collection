require 'rails_helper'

RSpec.describe "CreatingBooks", type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'saves and displays the resulting book' do
    visit '/books/new'
    fill_in 'book_title', with: 'test book 1'
    click_on 'Create Book'
    expect(page).to have_content('test book 1')
    book = Book.order("id").last
    expect(book.title).to eq('test book 1')
  end

end
