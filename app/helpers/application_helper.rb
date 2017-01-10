module ApplicationHelper

  def search_title(q)
    "#{q} の検索結果"
  end

  def default_meta_tags
  {
    site: "I love sushi - 最寄りの寿司屋を簡単に検索",
    reverse: true,
    charset: "utf-8",
    description: "現在位置または指定した場所から最寄りの寿司屋を簡単に検索できます",
    viewport: "width=device-width, initial-scale=1.0",
    og: {
      title: :title,
      type: "website",
      site_name: "I love sushi",
      description: :description,
      image: "",
      url: "https://ilovesushi.herokuapp.com/",
    }
  }
end
end
