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

FactoryGirl.define do
  factory :affiliate_country do
    country "MyString"
    default_affiliate_tag "MyString"
    tracker "MyString"
    user nil
  end
end
