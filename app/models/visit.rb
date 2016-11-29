class Visit < ActiveRecord::Base

  #relationships
  #--------------------------------------------------------------------------------------------
  has_many :ahoy_events, class_name: "Ahoy::Event"
  belongs_to :user
  #--------------------------------------------------------------------------------------------
end
