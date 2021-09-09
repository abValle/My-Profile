class Dog
  def bark
    puts "woof woof"
  end
end

class GermanShepherd < Dog
end


jack = GermanShepherd.new
jack.bark
