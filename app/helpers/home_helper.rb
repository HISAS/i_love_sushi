module HomeHelper

  def calculate_walk_time(location1, location2)
    distance = Geocoder::Calculations.distance_between([location1[0],location1[1]], [location2.latitude, location2.longitude])
    walk_time = (distance * 20.1168).round
  end
end
