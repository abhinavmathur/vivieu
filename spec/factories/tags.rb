# == Schema Information
#
# Table name: tags
#
#  id          :integer          not null, primary key
#  title       :string           default("")
#  views       :integer          default(0)
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  owner_id    :integer
#

FactoryGirl.define do
  factory :tag do
    title "MyString"
    views 1
    owner 1
    category nil
  end
end
