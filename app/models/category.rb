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

class Category < ActiveRecord::Base

  #general
  #--------------------------------------------------------------------------------------------
  extend FriendlyId
  friendly_id :title, use: :slugged
  #--------------------------------------------------------------------------------------------

  #relationships
  #--------------------------------------------------------------------------------------------
  has_many :tags, dependent: :destroy
  #--------------------------------------------------------------------------------------------

  #validations
  #--------------------------------------------------------------------------------------------
  validates_presence_of :title
  validates_uniqueness_of :title
  #--------------------------------------------------------------------------------------------

  #methods
  #--------------------------------------------------------------------------------------------
  #[friendly_id method]
  def should_generate_new_friendly_id?
    title_changed?
  end

  #[method to sort categories]
  def self.select_order(val)
    permitted_values = %w(title-desc title-asc pop-asc pop-desc rev-asc rev-desc tag-asc tag-desc)
    if permitted_values.include?(val)
      if val == 'title-desc'
        return self.order('title desc')
      elsif val == 'title-asc'
        return self.order('title asc')
      elsif val == 'tag-asc'
        return self.order('tags_count asc')
      elsif val == 'tag-desc'
        return self.order('tags_count desc')
      elsif val == 'pop-desc'
        return self.order('views desc')
      elsif val == 'pop-asc'
        return self.order('views asc')
        end
    else
      self.order('title asc')
    end
  end
  #--------------------------------------------------------------------------------------------
end
