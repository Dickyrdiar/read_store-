class Launch < ApplicationRecord
    before_create  

    def set_uuid
        self.id = SecureRandom.uuid 
    end 

    has_many :books
    belongs_to :user, optional: true 
    belongs_to :store, optional: true 
end
