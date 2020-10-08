class Order < ApplicationRecord
    has_many :line_books, dependent: :destroy 
end
