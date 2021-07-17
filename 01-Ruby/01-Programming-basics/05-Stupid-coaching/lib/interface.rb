require_relative "coach_answer"
# TODO: Implement the program that makes you discuss with your coach from the terminal.
saida = nil

while saida != ""
  puts "Fala bisonho,"
  resposta = gets.chomp.to_s
  saida = coach_answer(resposta)
end
