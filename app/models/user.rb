class User < ApplicationRecord
  # Include default devise modules. Others available are:
   #:confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
         has_many :tv_shows
         has_many :comments, dependent: :delete_all
         has_many :tv_shows, through: :comments



    #       def self.from_omniauth(auth)
    #       where(auth.slice(:provider, :uid)).first_or_create do |user|
    #         user.provider = auth.provider
    #       user.email = auth.info.email
    #       # user.username = auth.info.nickname
    #        user.password = Devise.friendly_token[0, 20]
    #   end

    # end
  #     def self.new_with_session(params, session)
  #       if session["devise.user_attributes"]
  #         new(session["devise.user_attributes"], without_protection: true) do |user|
  #           user.attributes = params 
  #           user.valid?
  #     end
  #   else
  #      super 
  #   end 
  # end 

  def self.from_omniauth(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       
         
        user.provider = auth.provider
       user.username = auth.info.name
        user.email = auth.info.email
    
        user.password = Devise.friendly_token[0,20]
      end
  end
end