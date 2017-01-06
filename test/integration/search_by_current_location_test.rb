require 'test_helper'

class SearchByCurrentLocationTest < ActionDispatch::IntegrationTest
  test "search without parmas" do
    get root_path
    post search_by_current_location_path, params: { latitude: "", longitude: "" }
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "search with parmas" do
    get root_path
    post search_by_current_location_path, params: { latitude: "35.6815468", longitude: "139.6819786" }
    assert search_by_current_location_path, path
    assert flash.empty?
    assert_select "title", "日本, 〒151-0071 東京都渋谷区本町１丁目３６−１１ | I love sushi - 最寄りのお寿司屋さんを簡単に検索"
  end
end
