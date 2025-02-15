require_relative 'tasks'

def read_array
  File.read('array.txt').split.map(&:to_i)
end

def show_result(original, result, message)
  puts "\nИсходный массив: #{original}"
  puts message if message
  puts result
end

puts "Выберите задачу (1-2):"
choice = gets.chomp

array = read_array

case choice
when '1'
  result = reverse_between_min_max(array)
  message = "Перевернутые элементы между min и max"
when '2'
  result = two_largest_elements(array)
  message = "Два наибольних элемента: "
else
  puts "Некорректный выбор"
  exit
end

show_result(array.inspect, result.inspect, message)
