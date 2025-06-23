# == Schema Information
#
# Table name: tool_calls
#
#  id           :integer          not null, primary key
#  arguments    :json             not null
#  name         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  message_id   :integer          not null
#  tool_call_id :string
#
# Indexes
#
#  index_tool_calls_on_message_id    (message_id)
#  index_tool_calls_on_tool_call_id  (tool_call_id)
#
# Foreign Keys
#
#  message_id  (message_id => messages.id)
#
class ToolCall < ApplicationRecord
  acts_as_tool_call
end
