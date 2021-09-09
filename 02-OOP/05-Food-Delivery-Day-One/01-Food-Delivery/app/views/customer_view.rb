class CustomerView
  def ask_for_customers_name
    puts "What's the customers name?"
    print ">"
    gets.chomp
  end

  def ask_for_customers_address
    puts "What's the customers addres?"
    print ">"
    gets.chomp
  end

  def display(customers)
    customers.each do |customer|
      puts "Name: #{customer.name} -> Address: #{customer.address}"
    end
  end
end
