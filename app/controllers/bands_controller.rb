class BandsController < ApplicationController

  def index
    render :index
  end

  def new
    render :new
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to bands_url
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
