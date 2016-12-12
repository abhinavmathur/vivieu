class Specification < ActiveRecord::Base
  belongs_to :review
  validates_uniqueness_of :item, :description, scope: :review_id
end
