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

require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
