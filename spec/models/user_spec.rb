# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  vivieu_name            :string           default(""), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  description            :text             default("")
#  facebook               :string           default("")
#  twitter                :string           default("")
#  patreon                :string           default("")
#  google_plus            :string           default("")
#  personal_website       :string           default("")
#  uid                    :string           default("")
#  avatar                 :string           default("")
#  token                  :string           default("")
#  refresh_token          :string           default("")
#  locale                 :string           default("en")
#  admin                  :boolean          default(FALSE)
#  reviewer               :boolean          default(FALSE)
#  toc                    :boolean          default(FALSE)
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  slug                   :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
