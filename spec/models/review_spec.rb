# == Schema Information
#
# Table name: reviews
#
#  id                         :integer          not null, primary key
#  title                      :string           default("")
#  description                :text             default("")
#  youtube_id                 :string           default("")
#  tags                       :string           default("")
#  amazon_product_title       :string           default("")
#  amazon_product_description :string           default("")
#  asin                       :string           default("")
#  slug                       :string
#  publish                    :boolean          default(FALSE)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  reviewer_id                :integer
#

require 'rails_helper'

RSpec.describe Review, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
