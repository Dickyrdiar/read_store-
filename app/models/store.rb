class Store < ApplicationRecord
    # uuid
    before_create :set_uuid 

    def set_uuid 
        self.id = SecureRandom.uuid 
    end 

    # database relation
    has_many :books

    validate :name_store 
    validate :desc 
    validate :call_number
end
