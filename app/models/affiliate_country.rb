# == Schema Information
#
# Table name: affiliate_countries
#
#  id                    :integer          not null, primary key
#  country               :string           default("")
#  default_affiliate_tag :string           default("")
#  tracker               :string           default("")
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class AffiliateCountry < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :country, :default_affiliate_tag
  validates_uniqueness_of :country

end
