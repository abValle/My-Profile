def french_phone_number?(phone_number)
  # TODO: true or false?
  if phone_number =~ /^(\+33)\s[1-9]\s\d{2}\s\d{2}\s\d{2}|^0[1-9](\s?|-)\d{2}(\s?|-)\d{2}(\s?|-)\d{2}(\s?|-)\d{2}/
    return true
  else
    return false
  end
end
