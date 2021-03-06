class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

         has_many :posts
         has_many :comments

         def self.from_omniauth(auth)
             where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
               puts "creating new user#{auth.uid}"
               user.provider = auth.provider
               user.uid = auth.uid
               user.email = auth.info.email
               user.password = Devise.friendly_token[0,20]
             end
         end

  def admin?
    return has_role?(:admin)
  end



end
