class HomeController < ApplicationController
  def index
  end

  def search
    location = params[:word]
    locale = { lang: 'ja' }
    @results = Yelp.client.search(location, { term: 'sushi' }, locale)
  end
end
