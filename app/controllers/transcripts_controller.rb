class TranscriptsController < ApplicationController
  def create
    transcript = Transcript.find_by(id: session[:transcript_id])
    transcript ||= Transcript.new


    transcript.update(transcript_params)
    session[:transcript_id] ||= transcript.id if transcript.persisted?

    render turbo_stream: turbo_stream.replace(
      "transcript_form",
      partial: "transcripts/form",
      locals: { transcript: transcript })
  end

  def update
    transcript = Transcript.find(params[:id])
    session[:transcript_id] ||= transcript.id

    transcript.update(transcript_params)

    render turbo_stream: turbo_stream.replace(
      "transcript_form",
      partial: "transcripts/form",
      locals: { transcript: transcript })
  end

  private

  def transcript_params
    params.require(:transcript).permit(:body)
  end
end
