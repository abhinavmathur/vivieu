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

class Tag < ActiveRecord::Base

  #relationships
  #--------------------------------------------------------------------------------------------
  belongs_to :category
  belongs_to :owner, class_name: 'User'
  counter_culture :category
  #--------------------------------------------------------------------------------------------

  #validations
  #--------------------------------------------------------------------------------------------
  validates_uniqueness_of :title
  validates_presence_of :title, :owner, :category_id
  #--------------------------------------------------------------------------------------------

  #methods
  #--------------------------------------------------------------------------------------------
  def self.search(search)
    where("title ILIKE ? ", "%#{search}%")
  end
  #--------------------------------------------------------------------------------------------
end

