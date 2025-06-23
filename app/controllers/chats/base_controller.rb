module Chats
  class BaseController < ApplicationController
    before_action :set_chat

    def set_chat
      @chat = Chat.find(params[:chat_id])
    end
  end
end
