class BeercansController < ApplicationController

  def index
    # this will show info or whatever in the server log
    logger.info "yo, beercans world!!"
    @beercans = Beercan.all

    respond_to do |format|
      format.html { render 'index' }
      format.json { render :json => @beercans }
    end

    # There is a reason for everything... explains why something is happening... it's not magic there is a cause in effect.
    # logger.info @beercans.inspect
  end

  def create
    logger.info "----> CREATE <-----"

    # SUPER SHORT HAND with .create and form_for helper that makes an object for the form data
    can = Beercan.create(params[:beercan])

    # SHORTER HAND with form_tag helper using params in .create method
    # you can use arguments that will intialize an instance with params for a new model instance. if you use .create it will also .save
    # can = Beercan.create({  :url => params[:url],
    #                         :caption => params[:caption],
    #                         :brewery => params[:brewery],
    #                         :year_brewed => params[:year_brewed]
    #                       })

    # ORIGINAL LONG HAND APPROACH FOR NEW INSTANCE
    # can = Beercan.new
    # can.url = params[:url]
    # can.caption = params[:caption]
    # can.brewery = params[:brewery]
    # can.year_brewed = params[:year_brewed]
    # can.save

    redirect_to beercans_url
  end

  def show
    @can = Beercan.find_by_id(params[:id])
  end

  def edit
    @can = Beercan.find_by_id(params[:id])
  end

  def update
    # logger.info "working on update here:"
    # logger.info params.inspect
    # can = Beercan.find_by_id(params[:id])
    logger.info "beercan id on update: #{params["id"]}"
    # logger.info "beercan object on update here: #{["beercan"]["id"]}"
    # can = Beercan.find_by_id(params[:beercan])
    # logger.info "beercan object: #{can}"
    can = Beercan.find_by_id(params[:id]).update_attributes(params[:beercan])
    # can = Beercan.find_by_id(params[:id]).update_attributes({
    #                                       :url => params[:url],
    #                                       :caption => params[:caption],
    #                                       :brewery => params[:brewery],
    #                                       :year_brewed => params[:year_brewed]
    #                                       })
    # can.url = params[:url]
    # can.caption = params[:caption]
    # can.brewery = params[:brewery]
    # can.year_brewed = params[:year_brewed]
    # can.save
    redirect_to beercans_url
  end

  def delete
    can = Beercan.find_by_id(params[:id])
    can.destroy
    redirect_to beercans_url
  end

  def new
    @can = Beercan.new
  end

end
