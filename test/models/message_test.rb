# == Schema Information
#
# Table name: messages
#
#  id            :integer          not null, primary key
#  content       :text             not null
#  input_tokens  :integer
#  output_tokens :integer
#  role          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  chat_id       :integer          not null
#  model_id      :string           not null
#  tool_call_id  :integer
#
# Indexes
#
#  index_messages_on_chat_id       (chat_id)
#  index_messages_on_tool_call_id  (tool_call_id)
#
# Foreign Keys
#
#  chat_id       (chat_id => chats.id)
#  tool_call_id  (tool_call_id => tool_calls.id)
#
require "test_helper"

class MessageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
