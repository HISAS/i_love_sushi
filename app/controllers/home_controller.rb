class HomeController < ApplicationController
  def index
  end

  def search
    if params[:word].blank?
      redirect_to root_url
    end

    location = params[:word]
    parameters = { limit: 10, category_filter: 'sushi', sort: 1 }
    locale = { lang: 'ja' }
    response = Yelp.client.search(location, parameters, locale)
    @results = response.businesses
  end
end
