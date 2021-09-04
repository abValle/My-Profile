require "faker"
# TODO: Write a seed to insert 100 posts in the database
n = 0
100.times do
  Post.create(title: "Title #{n}", url: "www.title#{n}.org")
  n += 1
end
