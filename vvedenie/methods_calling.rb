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


method_choice = ARGV[0]
file_path = ARGV[1]   


if method_choice.nil? || file_path.nil?
  puts "Ошибка: необходимо передать два аргумента — метод и путь к файлу."
  puts "Пример использования: ruby for_and_while.rb find_min_with_for data.txt"
  exit
end


unless File.exist?(file_path)
  puts "Ошибка: файл #{file_path} не найден."
  exit
end


begin
  array = File.readlines(file_path).map(&:to_i)
rescue ArgumentError, TypeError
  puts "Ошибка: файл #{file_path} 
  exit
end


if array.empty?
  puts "Ошибка: файл #{file_path} пуст. Добавьте числа в файл."
  exit
end


result = case method_choice
when "find_min_with_for"
  find_min_with_for(array)
when "find_first_positive_with_for"
  find_first_positive_with_for(array)
when "find_min_with_while"
  find_min_with_while(array)
when "find_first_positive_with_while"
  find_first_positive_with_while(array)
else
  puts "Ошибка: неизвестный метод #{method_choice}. Выберите один из:"
  puts "- find_min_with_for"
  puts "- find_first_positive_with_for"
  puts "- find_min_with_while"
  puts "- find_first_positive_with_while"
  exit
end

puts "Результат метода #{method_choice}: #{result}"
