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
class Message < ApplicationRecord
  include ActionView::RecordIdentifier

  acts_as_message

  has_many_attached :attachments

  validates :role, presence: true

  before_validation :set_model_id

  after_create :broadcast_new_message
  # after_update_commit :broadcast_change
  after_destroy_commit :broadcast_destroy

  # Helper to broadcast chunks during streaming
  def broadcast_append_chunk(chunk_content)
    broadcast_append_to [ chat, :messages ],
      target: dom_id(self, :content),
      html: chunk_content
  end


  private

  def broadcast_new_message
    stream_target = [ chat, :messages ]
    locals = { message: self }
    target = dom_id(chat, :message_list)

    broadcast_append_to stream_target, partial: "messages/message", locals: locals, target: target
  end

  def broadcast_change
    stream_target = [ chat, :messages ]
    locals = { message: self }

    broadcast_update_to stream_target, partial: "messages/message", locals: locals, target: dom_id(self)
  end

  def broadcast_destroy
    stream_target = [ chat, :messages ]
    broadcast_remove_to stream_target, target: dom_id(self)
  end

  def set_model_id
    self.model_id ||= Chat::MODEL_ID
  end
end
