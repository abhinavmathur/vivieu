class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  has_many :tags, dependent: :destroy

  def should_generate_new_friendly_id?
    title_changed?
  end

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
end
