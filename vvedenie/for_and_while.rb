# Метод для нахождения минимального элемента циклом for
def find_min_with_for(arr)
  min = arr[0] 
  for i in 1...arr.length 
    min = arr[i] if arr[i] < min 
  end
  min
end


# Метод для нахождения номера первого положительного элемента циклом for
def find_first_positive_with_for(arr)
  for i in 0...arr.length 
    return i if arr[i] > 0 
  end
  nil 
end



# Метод для нахождения минимального элемента циклом while
def find_min_with_while(arr)
  min = arr[0] 
  i = 1
  while i < arr.length 
    min = arr[i] if arr[i] < min 
    i += 1
  end
  min
end

# Метод для нахождения номера первого положительного элемента циклом while
def find_first_positive_with_while(arr)
  i = 0
  while i < arr.length 
    return i if arr[i] > 0 
    i += 1
  end
  nil 
end




arr = [0, -5, 3, -2, 8, -1]


min_value = find_min_with_for(arr)
first_positive_index = find_first_positive_with_for(arr)

puts "Минимальный элемент: #{min_value}"
puts "Номер первого положительного элемента: #{first_positive_index}"


min_value_while = find_min_with_while(arr)
first_positive_index_while = find_first_positive_with_while(arr)

puts "Минимальный элемент (while): #{min_value_while}"
puts "Номер первого положительного элемента (while): #{first_positive_index_while}"

