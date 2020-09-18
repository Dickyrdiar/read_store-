class User < ApplicationRecord
  extend Devise::Models
  acts_as_token_authenticatable 
  
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]
  # uuid
  before_create :set_uuid 

  def set_uuid 
    self.id = SecureRandom.uuid 
  end 

  # database relation
  has_many :books 
  has_many :stores

  has_many :reviews

  # validates model  
  validate :email 
  validate :password

  def generate_password_token! 
    self.reset_password_toke = generate_token 
    self.reset_password_sent_at = Time.now.utc 
  end 

  def password_token_valid? 
    (self.reset_password_sent_at + 4.hours) > Time.new.utc
  end 

  def reset_password!(password)
    self.reset_password_token = nil 
    self.password = password
    save!
  end 

  private  

  def generate_token
    SecureRandom.hex(10)
  end 

end
