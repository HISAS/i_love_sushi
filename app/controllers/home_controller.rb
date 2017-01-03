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
  end
end
