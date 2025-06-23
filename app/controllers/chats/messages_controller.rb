module Chats
  class MessagesController < BaseController
    def index
      @messages = @chat.messages.order(created_at: :desc)
    end

    def create
      ChatStreamJob.perform_later(@chat.id, message_params[:content], current_transcript.id)

      render turbo_stream: [
        turbo_stream.replace(
          "prompt_form",
          partial: "chats/messages/form",
          locals: { chat: @chat, message: Message.new }
        )
      ]
    end

    private

    def message_params
      params.require(:message).permit(:content).tap do |data|
        data[:role] = :user
      end
    end
  end
end
