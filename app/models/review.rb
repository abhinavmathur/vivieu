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
#  category_id                :integer
#

class Review < ActiveRecord::Base

  #general
  #--------------------------------------------------------------------------------------------
  extend FriendlyId
  friendly_id :title, use: :slugged

  def should_generate_new_friendly_id?
    title_changed?
  end
  #--------------------------------------------------------------------------------------------

  #relationships
  #--------------------------------------------------------------------------------------------
  belongs_to :reviewer, class_name: 'User'
  belongs_to :category
  #--------------------------------------------------------------------------------------------

  #validations
  #--------------------------------------------------------------------------------------------
  validates_presence_of :title, :asin, :category_id
  validates_uniqueness_of :title, message: '^This title has been taken by someone else'
  validates_uniqueness_of :youtube_id, message: '^You cannot use the same video twice', if: :review_published?
  #--------------------------------------------------------------------------------------------

  #methods
  #--------------------------------------------------------------------------------------------

  def review_published?
    publish?
  end
  #--------------------------------------------------------------------------------------------

end
