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

class Tag < ActiveRecord::Base
  belongs_to :category
  counter_culture :category

  validates_uniqueness_of :title
  validates_presence_of :title, :owner, :category_id
end
