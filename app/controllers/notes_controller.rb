class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    note.user_id = current_user.id
    if note.save
      redirect_to track_url(note_params[:track_id])
    else
      render text: "you lose."
    end
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :note)
  end
end
