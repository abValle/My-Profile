require 'open-uri'
require 'nokogiri'

class Author
  def initialize(post_url)
    @url = post_url
  end

  def editing
    html = URI.open(@url).read
    nokogiri_doc = Nokogiri::HTML(html)
    final_array = []
    nokogiri_doc.search("span").each do |element|
      element = element.text.strip
      final_array << element
    end
    final_array.each do |element|
      puts element
    end
  end
end

puts "url? "
site = gets.chomp


teste = Author.new(site)
teste.editing
