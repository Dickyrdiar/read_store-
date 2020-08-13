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

end
