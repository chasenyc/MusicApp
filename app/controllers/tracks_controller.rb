class TracksController < ApplicationController

  def new
    @album_id = params[:album_id].to_i
    @albums = Album.all
    render :new
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      render :show
    else
      flash.now[:errors] = @track.errors.full_messages
      render :new
    end
  end

  def show
    @track = Track.find(params[:id])
    render :show
  end

  def edit
    @track = Track.find(params[:id])
    @albums = Album.all
    render :edit
  end

  def update
    @track = Track.find(params[:id])
    @track.update(track_params)
    if @track.save
      render :show
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    if @track.delete
      redirect_to bands_url
    else
      flash.now[:errors] = @track.errors.full_messages
      render :edit
    end
  end

  private

  def track_params
    params.require(:track).permit(:album_id, :name, :bonus_or_regular, :lyrics)
  end

end
