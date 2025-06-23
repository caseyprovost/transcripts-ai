class ApplicationController < ActionController::Base
  # include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_chat

  def current_chat
    if session[:chat_id]
      @current_chat ||= RubyLLM.chat.find(session[:chat_id])
    else
      @current_chat ||= RubyLLM.chat
      session[:chat_id] = @current_chat.id
    end
  end
end
