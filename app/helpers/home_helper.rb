module HomeHelper

  def calculate_walk_time(location1, location2)
    if location1[0].is_a?(String)
      location1[0] = location1[0].to_f
      location1[1] = location1[1].to_f
    end
    distance = Geocoder::Calculations.distance_between([location1[0],location1[1]], [location2.latitude, location2.longitude])
    walk_time = (distance * 20.1168).round
  end
end
