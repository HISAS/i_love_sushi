class HomeController < ApplicationController
  def index
  end

  def search
    @results = Yelp.client.search('Tokyo', { term: 'sushi' })
  end
end
