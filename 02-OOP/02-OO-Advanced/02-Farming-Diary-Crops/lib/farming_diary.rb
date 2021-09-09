# DO NOT remove the two lines below, needed for display purposes
require_relative "../spec/helper/board"

require_relative "corn"
require_relative "rice"
require_relative 'crop'

puts "\n\n📝 Day One: Corn"
# 1. Instantiate a corn crop
amount_corn = Corn.new
# 2. Water the corn crop
amount_corn.water!
amount_corn.water!

# 3. Replace 'TODO' with the value of `grains` for your crop
puts "The corn crop produced #{amount_corn.grains} grains"
# 4. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The corn crop is #{amount_corn.ripe? ? 'ripe' : 'not ripe'}"



puts "\n\n📝 Day Two: Rice"
# 1. Instantiate a rice crop
amount_rice = Rice.new

# 2. Water the rice crop
amount_rice.water!

# 3. Transplant the rice crop
amount_rice.transplant!
# 4. Replace 'TODO' with the value of `grains` for your crop
puts "The rice crop produced #{amount_rice.grains} grains"
# 5. Replace 'TODO' with the state of the crop ('ripe' or 'not ripe')
puts "The rice crop is #{amount_rice.ripe? ? 'ripe' : 'not ripe'}"


# DO NOT remove the two lines below, needed for display purposes
Board.new.display
