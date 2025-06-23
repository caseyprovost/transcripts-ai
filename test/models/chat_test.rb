# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  model_id   :string           not null
#  user_id    :integer
#
# Indexes
#
#  index_chats_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class ChatTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
