require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", 'https://github.com/HISAS/i_love_sushi'
    assert_select "a[href=?]", 'https://github.com/HISAS'
    assert_select "a[href=?]", 'https://www.heroku.com/'
    assert_select "a[href=?]", 'https://www.yelp.com/'
  end
end
