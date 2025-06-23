class ChatStreamJob < ApplicationJob
  queue_as :default

  def perform(chat_id, user_content, transcript_id)
    chat = Chat.find(chat_id)
    transcript = Transcript.find(transcript_id)
    file = File.open(Rails.root.join("tmp/test.txt"), "w")
    file.write(transcript.body)
    file.close

    chat.ask(user_content, with: file.path) do |chunk|
      # Get the assistant message record (created before streaming starts)
      assistant_message = chat.messages.last
      if chunk.content && assistant_message
        # Append the chunk content to the message's target div
        assistant_message.broadcast_append_chunk(chunk.content)
      end
    end
    # Final assistant message is now fully persisted
  end
end
