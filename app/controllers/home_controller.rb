class HomeController < ApplicationController
  include Common

  def index
  end

  def search_by_address
    if params[:word].blank?
      redirect_to root_url
    end

    @ll = Geocoder.coordinates(params[:word])
    search_sushi_by_yelp
    create_google_map(params[:word])
  end

  def search_by_current_location
    @ll = []
    @ll.push(params[:latitude], params[:longitude])
    ll = @ll[0] + "," + @ll[1]
    Geocoder.configure(:language  => :ja)
    @current_location = Geocoder.address(ll)

    search_sushi_by_yelp
    create_google_map(@current_location)
  end
end
