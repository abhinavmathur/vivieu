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

FactoryGirl.define do
  factory :review do
    title "MyString"
    description "MyText"
    youtube_id "MyString"
    tags "MyString"
    amazon_product_title "MyString"
    amazon_product_description "MyString"
    asin "MyString"
    publish false
  end
end
