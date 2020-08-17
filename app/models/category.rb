class Category < ApplicationRecord
    before_create :set_uuid 

    def set_uuid
        self.id = SecureRandom.uuid 
    end 

    # database relation 
    belongs_to :book, optional: true 
end
