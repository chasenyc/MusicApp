class AlbumsController < ApplicationController

  before_action :authenticate_user!

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
    @album = Album.find(params[:id])
    @bands = Band.all
    render :edit
  end

  def update
    @album = Album.find(params[:id])
    @album.update(album_params)
    if @album.save
      render :show
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    if @album.delete
      redirect_to bands_url
    else
      flash.now[:errors] = @album.errors.full_messages
      render :edit
    end
  end

  private

  def album_params
    params.require(:album).permit(:band_id, :title, :live_or_studio)
  end

end
