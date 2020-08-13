class Order < ApplicationRecord
    before_create :set_uiid

    def set_uuid
        self.id = SecureRandom.uuid  
    end 

    has_many :books 
    belongs_to :user, optional: true 
end
