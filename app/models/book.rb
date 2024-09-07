class Book < ApplicationRecord

    has_many :users, through: :user_books
    has_many :user_books

    # a Book must have a title to be valid. (my implementation is different from theirs.)
    validates :title, presence: true
end
