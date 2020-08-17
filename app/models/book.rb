class Book < ApplicationRecord
    # uuid
    before_create :set_uuid 

    def set_uuid 
        self.id = SecureRandom.uuid 
    end
    
    # image  
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100" }, default_url: "images/:style/missing.png"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    # database relation 
    belongs_to :user, optional: true
    belongs_to :store, optional: true 
    has_many :reviews   
    
    has_many :categories

end
