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

require 'rails_helper'

RSpec.describe AffiliateCountry, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
