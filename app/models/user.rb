class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    where( uid: auth.uid, email: auth.info.email).first_or_create do |user|
      user.vivieu_name = auth.info.email.to_s.split('@')[0].to_s + "'s reviews"
      user.email = auth.info.email
      user.uid = auth.uid
      user.avatar = auth.info.image
      user.token = auth.credentials.token
      user.refresh_token = auth.credentials.refresh_token
      user.password = Devise.friendly_token.first(12)
      user.locale = auth.extra.raw_info.locale
      user.google_plus = auth.extra.raw_info.profile
      user.personal_website = auth.extra.raw_info.id
      user.save!
    end
  end


end


