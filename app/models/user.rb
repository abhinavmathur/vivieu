# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  vivieu_name            :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  description            :text             default("")
#  facebook               :string           default("")
#  twitter                :string           default("")
#  patreon                :string           default("")
#  google_plus            :string           default("")
#  personal_website       :string           default("")
#  uid                    :string           default("")
#  avatar                 :string           default("")
#  token                  :string           default("")
#  refresh_token          :string           default("")
#  locale                 :string           default("en")
#  admin                  :boolean          default(FALSE)
#  reviewer               :boolean          default(FALSE)
#  toc                    :boolean          default(FALSE)
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  validates :vivieu_name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

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
      user.personal_website = auth.extra.raw_info.hd
      #todo welcome email
      user.save!
    end
  end


end


