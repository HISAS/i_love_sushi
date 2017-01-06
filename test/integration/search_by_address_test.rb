require 'test_helper'

class SearchByAddressTest < ActionDispatch::IntegrationTest
  test "search without params word" do
    get root_path
    get search_by_address_path, params: { word: "" }
    assert_not flash.empty?
  end

  test "search with params word" do
    get root_path
    get search_by_address_path, params: { word: "東京駅" }
    assert search_by_address_path, path
    assert flash.empty?
    assert_select "title", "東京駅 の検索結果 | I love sushi - 最寄りのお寿司屋さんを簡単に検索"
  end
end
