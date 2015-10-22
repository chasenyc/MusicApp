class BandsController < ApplicationController

  before_action :authenticate_user!

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
    @band = Band.find(params[:id])
    render :edit
  end

  def update
    @band = Band.find(params[:id])
    @band.update(band_params)
    if @band.save
      render :show
    else
      flash.now[:errors] = @band.errors.full_messages
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    if @band.delete
      render :index
    else
      flash.now[:errors] = @band.errors.full_messages
      render :index
    end
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
