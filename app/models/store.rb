class Store < ApplicationRecord
    # uuid
    before_create :set_uuid 

    def set_uuid 
        self.id = SecureRandom.uuid 
    end 

    # database relation
    has_many :books
    has_many :launches

    validate :name_store 
    validate :desc 
    validate :call_number

    # image connection 
    has_attached_file :image, style: { medium: "300x300>", thumb: "100x100>"}
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
