require "json"
require "rest-client"

# TODO: Write a seed to insert 10 posts in the database fetched from the Hacker News API.

url = "https://hacker-news.firebaseio.com/v0/topstories.json"
post_ids = JSON.parse(RestClient.get(url))

post_ids.take(10).each do |id|
  new_post = JSON.parse(RestClient.get("https://hacker-news.firebaseio.com/v0/item/#{id}.json"))
  post = Post.new(
    title: new_post["title"],
    url: new_post["url"],
    votes: new_post["score"]
  )
  post.save
end
