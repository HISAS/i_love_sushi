module Common
  extend ActiveSupport::Concern

  def search_sushi_by_yelp
    coordinates = { latitude: @ll[0], longitude: @ll[1] }
    parameters = { limit: 10, category_filter: 'sushi', sort: 1 }
    locale = { lang: 'ja' }
    response = Yelp.client.search_by_coordinates(coordinates, parameters, locale)
    @results = response.businesses
  end

  def create_google_map(infowindow)
    @hash = Gmaps4rails.build_markers(@results) do |result, marker|
      marker.lat result.location.coordinate.latitude
      marker.lng result.location.coordinate.longitude
      marker.infowindow result.name
    end
    @hash.push({ lat: @ll[0], lng: @ll[1], infowindow: infowindow })
  end

end
