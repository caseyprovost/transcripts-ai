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
class Chat < ApplicationRecord
  MODEL_ID = "anthropic/claude-sonnet-4"

  acts_as_chat

  belongs_to :user, optional: true
  validates :model_id, presence: true

  before_validation :set_model_id

  broadcasts_to ->(chat) { [ chat, "messages" ] }

  def self.create_with_welcome_message
    chat = new
    chat.save!
    chat
  end

  def self.find_or_create_by_user(user)
    find_or_create_by(user: user) do |chat|
      chat.model_id = MODEL_ID
    end
  end

  private

  def set_model_id
    self.model_id ||= MODEL_ID
  end
end
