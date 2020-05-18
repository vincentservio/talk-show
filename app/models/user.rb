class User < ApplicationRecord
  # Include default devise modules. Others available are:
   #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         has_many :tv_shows
         has_many :comments, dependent: :delete_all
         has_many :tv_shows, through: :comments
        validates :email, uniqueness: true
        validates :username, uniqueness: true
        validates :password, presence: true
       validates :username, length: { minimum: 2 }
       validates :email, length: { minimum: 2 }

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       
         
        user.provider = auth.provider
       user.username = auth.info.name
        user.email = auth.info.email
    
        user.password = Devise.friendly_token[0,20]
      end
  end
end