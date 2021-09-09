require_relative "wagon_sort"

# TODO: Ask the user about students to add to the Wagon.
#       Remember, to read an input from the command line, use:
#       - `gets`:  http://www.ruby-doc.org/core-2.5.3/Kernel.html#method-i-gets
#       - `chomp`: http://www.ruby-doc.org/core-2.5.3/String.html#method-i-chomp


students = []
name = nil

while name != ""
  puts "Adicione o nome: "
  name = gets.chomp.to_s
  next if name == ""

  students << name
  sortered_students = wagon_sort(students)
  puts "#{students.count} student"
  puts students[0]
  if sortered_students.count == 3 || sortered_students.count == 4
    puts "#{students.count} students"
    puts "#{sortered_students[0..-2].join(', ')} and #{sortered_students.last}."
  end
end

# TODO: Then call `wagon_sort` method defined in the wagon_sort.rb
#       file and display the sorted student list
