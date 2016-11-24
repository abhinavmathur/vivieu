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

require 'rails_helper'

RSpec.describe Tag, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
