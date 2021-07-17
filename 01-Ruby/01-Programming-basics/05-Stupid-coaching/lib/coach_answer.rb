def coach_answer(your_message)
  # TODO: return coach answer to your_message
  if your_message == "I am going to work right now!"
    ""
  elsif your_message.end_with?("?")
    "Silly question, get dressed and go to work!"
  else
    "I don't care, get dressed and go to work!"
  end
end

def coach_answer_enhanced(your_message)
  # TODO: return coach answer to your_message, with additional custom rules of yours!
  resposta = "i am going to work right now!"
  if your_message == your_message.upcase && your_message.end_with?("?")
    "I can feel your motivation! Silly question, get dressed and go to work!"
  elsif your_message != your_message.upcase && your_message.end_with?("?")
    "Silly question, get dressed and go to work!"
  elsif your_message.downcase == resposta || your_message == resposta.upcase
    ""
  elsif your_message == your_message.upcase
    "I can feel your motivation! I don't care, get dressed and go to work!"
  else
    "I don't care, get dressed and go to work!"
  end
end
