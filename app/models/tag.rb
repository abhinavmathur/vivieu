class Tag < ActiveRecord::Base
  belongs_to :category
  counter_culture :category
end
