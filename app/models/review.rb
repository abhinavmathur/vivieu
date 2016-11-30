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

class Review < ActiveRecord::Base

  #general
  #--------------------------------------------------------------------------------------------
  extend FriendlyId
  friendly_id :title, use: :slugged
  #--------------------------------------------------------------------------------------------

  #relationships
  #--------------------------------------------------------------------------------------------
  belongs_to :reviewer, class_name: 'User'
  #--------------------------------------------------------------------------------------------

  #validations
  #--------------------------------------------------------------------------------------------
  validates_presence_of :title, :asin
  validates_uniqueness_of :title
end
