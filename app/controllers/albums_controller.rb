class AlbumsController < ApplicationController

  def new
    @band_id = params[:band_id].to_i
    @bands = Band.all
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
    render :show
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :live_or_studio)
  end

end
