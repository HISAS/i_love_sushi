class HomeController < ApplicationController
  def index
  end

  def search
    if params[:word].blank?
      redirect_to root_url
    end

    location = params[:word]
    locale = { lang: 'ja' }
    response = Yelp.client.search(location, { term: 'sushi' }, locale)
    @results = response.businesses
  end
end
