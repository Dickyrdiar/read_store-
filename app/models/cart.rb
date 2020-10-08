class Cart < ApplicationRecord
    before_create :set_uuid 

    def self_uui
        self.uuid = SecureRandom.uuid 
    end

    has_many :line_books, dependent: :destroy 
    has_many :books, through: :line_books

    def add_item(book_id)
        book = Book.where('book_id ?', book_id).first 
        if book 
            book.quantity + 1 
            save 
        else 
            cart.books << Book.new(book_id: book_id, quantity: 1)
        end 
        save 
    end 

    # def sub_total
    #     sum = 0 
    #     self.line_books.each do |line| 

    # end 
end
