class HomeController < ApplicationController
  include Common

  def index
  end

  def search_by_address
    @ll = Geocoder.coordinates(params[:word])
    if @ll == nil
      flash.now[:danger] = '場所を特定することができませんでした。'
      return redirect_to root_url
    end
    search_sushi_by_yelp
    create_google_map(params[:word])
  end

  def search_by_current_location
    @ll = []
    @ll.push(params[:latitude], params[:longitude])
    ll = @ll[0] + "," + @ll[1]
    Geocoder.configure(:language  => :ja)
    @current_location = Geocoder.address(ll)
    if @current_location == nil
      flash.now[:danger] = '場所を特定することができませんでした。'
      return redirect_to root_url
    end
    search_sushi_by_yelp
    create_google_map(@current_location)
  end
end
