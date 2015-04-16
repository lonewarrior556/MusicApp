class BandsController < ApplicationController
  before_action :require_login

   # impled index

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def add_page
    @band = Band.new
    render :add_page
  end

  def add_band
    @band = Band.new(params[:band].permit(:name))
    if @band.save
      @errors = ["save succesful"]
      render :index
    else
      @errors = @band.errors.full_messages
      render :add_page
    end
  end



end
