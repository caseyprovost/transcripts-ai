# == Schema Information
#
# Table name: transcripts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_transcripts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class TranscriptTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
