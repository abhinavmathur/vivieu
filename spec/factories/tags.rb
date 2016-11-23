# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  title       :string           default("")
#  views       :integer          default(0)
#  owner       :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :tag do
    title "MyString"
    views 1
    owner 1
    category nil
  end
end
