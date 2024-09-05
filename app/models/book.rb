class Book < ApplicationRecord

    # a Book must have a title to be valid.
    validates :title, presence: true
end
