require_relative 'tasks'

def read_array_from_file
  File.read('array.txt').split.map(&:to_i)
end

def read_array_from_user
  puts "Введите список чисел через пробел:"
  gets.chomp.split.map(&:to_i)
end

def show_result(original, result, message)
  puts "\nИсходный массив: #{original}"
  puts message if message
  puts result
end

puts "Выберите задачу (1-5):"
choice = gets.chomp

array = ['4', '5'].include?(choice) ? read_array_from_user : read_array_from_file

case choice
when '1'
  result = reverse_between_min_max(array)
  message = "Перевернутые элементы между min и max:"
when '2'
  result = two_largest_elements(array)
  message = "Два наибольших элемента:"
when '3'
  result = max_odd_element(array)
  message = "Максимальный нечетный элемент:"
when '4'
  result = indices_of_most_frequent(array)
  message = "Индексы наиболее часто повторяющегося элемента:"
when '5'
  result = unique_elements_divisible_by_position(array)
  message = "Элементы, делящиеся на свой номер и встречающиеся 1 раз:"
else
  puts "Некорректный выбор"
  exit
end

show_result(array.inspect, result.inspect, message)
