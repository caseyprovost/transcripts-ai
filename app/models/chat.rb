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
  acts_as_chat

  belongs_to :user, optional: true
  validates :model_id, presence: true

  broadcasts_to ->(chat) { [ chat, "messages" ] }
end
