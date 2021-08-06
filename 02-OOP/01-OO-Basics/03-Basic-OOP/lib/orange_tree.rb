class OrangeTree
  # TODO: Implement all the specs defined in the README.md :)
  attr_reader :age, :height, :fruits

  def initialize
    @age = 0
    @height = 0
    @fruits = 0
  end

  def one_year_passes!
    # Add age
    @age += 1
    # Check height
    check_height
    # Growing fruitss
    grow_fruit
  end

  def dead?
    if @age == 100
      true
    elsif @age > 50
      rand(@age..100) == 100
    else
      false
    end
  end

  def pick_a_fruit!
    @fruits.zero? ? "It's Over" : @fruits -= 1
  end

  private

  def grow_fruit
    if @age > 5 && @age < 10
      @fruits = 100
    elsif @age >= 10 && @age < 15
      @fruits = 200
    else
      @fruits = 0
    end
  end

  def check_height
    @age <= 10 ? @height += 1 : nil
  end
end
