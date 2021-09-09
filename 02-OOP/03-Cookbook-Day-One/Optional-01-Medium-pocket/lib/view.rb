class View
  def ask_for_user_post
    puts "Type the URL"
    print ">"
    return gets.chomp
  end
end
