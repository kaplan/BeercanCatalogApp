class BeercansController < ApplicationController

  def index
    # this will show info or whatever in the server log
    logger.info "yo, beercans world!!"
    @beercans = Beercan.all
    # There is a reason for everything... explains why something is happening... it's not magic there is a cause in effect.
    # logger.info @beercans.inspect
  end

  def create
    logger.info "----> CREATE <-----"

    can = Beercan.new
    can.url = params[:url]
    can.caption = params[:caption]
    can.brewery = params[:brewery]
    can.year_brewed = params[:year_brewed]
    can.save
    redirect_to beercans_url
  end

  def show
    @can = Beercan.find_by_id(params[:id])
  end

  def edit
    @can = Beercan.find_by_id(params[:id])
  end

  def update
    logger.info "working on update here:"
    logger.info params.inspect
    can = Beercan.find_by_id(params[:id])
    # logger.info can
    can.url = params[:url]
    can.caption = params[:caption]
    can.brewery = params[:brewery]
    can.year_brewed = params[:year_brewed]
    can.save
    redirect_to beercans_url
  end

  def delete
    can = Beercan.find_by_id(params[:id])
    can.destroy
    redirect_to beercans_url
  end

  def new

  end

end
