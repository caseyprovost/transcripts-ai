class ApplicationController < ActionController::Base
  # include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  helper_method :current_chat

  def current_chat
    if session[:chat_id]
      @current_chat ||= Chat.find(session[:chat_id])
    else
      record = Chat.new
      record.save!
      record.with_instructions("Please use solely the information found in the transcript to answer questions.")
      @current_chat = record
      session[:chat_id] = record.id
      record
    end
  end

  def current_transcript
    @current_transcript ||= Transcript.find_by(id: session[:transcript_id]) || Transcript.new
  end
end
