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
#  slug                   :string
#

class User < ActiveRecord::Base

  #general
  #--------------------------------------------------------------------------------------------
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:google_oauth2]

  extend FriendlyId
  friendly_id :vivieu_name, use: :slugged
  #--------------------------------------------------------------------------------------------

  #callbacks
  #--------------------------------------------------------------------------------------------
  before_destroy :update_tags
  #--------------------------------------------------------------------------------------------

  #validations
  #--------------------------------------------------------------------------------------------
  validates_presence_of :vivieu_name, :email
  validates_uniqueness_of :vivieu_name, :email
  #--------------------------------------------------------------------------------------------

  #relationships
  #--------------------------------------------------------------------------------------------
  has_many :affiliate_countries, dependent: :destroy
  has_many :tags, dependent: :nullify, foreign_key: 'owner_id'
  has_many :reviews, dependent: :nullify, foreign_key: 'reviewer_id'
  accepts_nested_attributes_for :affiliate_countries, reject_if: proc { |attributes| attributes['default_affiliate_tag'].blank? }, allow_destroy: true
  #--------------------------------------------------------------------------------------------

  #methods
  #--------------------------------------------------------------------------------------------
  #[updates tags after someone deletes their account]
  def update_tags
    if self.tags.any?
      self.tags.each do |tag|
        tag.update(owner: User.first)
      end
    end
  end

  #[omniauth google]
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

  #[checks for roles]
  def self.roles(user)
    if user.admin?
      return 'Admin'
    elsif user.reviewer?
      return 'Reviewer'
    else
      'Normal'
    end
  end

  #[method to search users]
  def self.search(search)
    where("vivieu_name ILIKE ? OR email ILIKE ?", "%#{search}%", "%#{search}")
  end
  #--------------------------------------------------------------------------------------------
end


