# == Schema Information
#
# Table name: categories
#
#  id          :integer          not null, primary key
#  title       :string           default("")
#  description :text             default("")
#  views       :integer          default(0)
#  slug        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  tags_count  :integer          default(0), not null
#

FactoryGirl.define do
  factory :category do
    title "MyString"
    description "MyText"
    views 1
  end
end
