def burger(patty, sauce, topping)
  # TODO: code the `burger` method
  if block_given?
    new_patty = yield(patty)
    return ["bread", new_patty, sauce, topping, "bread"]
  else
    return ["bread", patty, sauce, topping, "bread"]
  end
end
