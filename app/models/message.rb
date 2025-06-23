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
#  tool_call_id  :integer          not null
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
class Message < ApplicationRecord
  acts_as_message

  has_many_attached :attachments

  belongs_to :chat

  validates :role, presence: true

  broadcasts_to ->(message) { [ message.chat, "messages" ] }

  # Helper to broadcast chunks during streaming
  def broadcast_append_chunk(chunk_content)
    broadcast_append_to [ chat, "messages" ], # Target the stream
      target: dom_id(self, "content"), # Target the content div inside the message frame
      html: chunk_content # Append the raw chunk
  end
end
