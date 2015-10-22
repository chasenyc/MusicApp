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

  def destroy
    fail
    @note = Note.find(params[:id])
    if @note.user_id != current_user.id
      render text: "you cannot delete other people's posts"
    end
    if @note.delete
      redirect_to track_url(@note.track_id)
    else
      flash.now[:errors] = @note.errors.full_messages
      redirect_to track_url(@note.track_id)
    end
  end

  private
  def note_params
    params.require(:note).permit(:track_id, :note)
  end
end


@band = Band.find(params[:id])
if @band.delete
  render :index
else
  flash.now[:errors] = @band.errors.full_messages
  render :index
end
