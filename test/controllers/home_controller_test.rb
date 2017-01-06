require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "I love sushi - 最寄りのお寿司屋さんを簡単に検索"
  end

  test "should get root" do
    get root_path
    assert_response :success
    assert_select "title", @base_title
  end
end
