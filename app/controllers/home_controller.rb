class HomeController < ApplicationController
  def index
  end

  def search
    if params[:word].blank?
      redirect_to root_url
    end

    @ll = Geocoder.coordinates(params[:word])
    coordinates = { latitude: @ll[0], longitude: @ll[1] }
    parameters = { limit: 10, category_filter: 'sushi', sort: 1 }
    locale = { lang: 'ja' }
    response = Yelp.client.search_by_coordinates(coordinates, parameters, locale)
    @results = response.businesses

    @hash = Gmaps4rails.build_markers(@results) do |result, marker|
      marker.lat result.location.coordinate.latitude
      marker.lng result.location.coordinate.longitude
      marker.infowindow result.name
    end
    @hash.push({ lat: @ll[0], lng: @ll[1], infowindow: params[:word] })
  end
end
