require_relative 'tasks'

puts "Выберите задачу (1):"
choice = gets.chomp

case choice
when '1'
  begin
    array = File.read('array.txt').chomp.split.map(&:to_i)
    
    if array.empty?
      puts "Ошибка: Пустой массив в файле"
      exit
    end

    data = reverse_between_min_max(array)
    
    puts "\nИсходный массив: #{array.inspect}"
    puts "Результат: #{data[:result].inspect}"
    
    if data[:start_idx] + 1 < data[:end_idx]
      puts "Перевёрнуты элементы между #{array[data[:start_idx]]} (индекс #{data[:start_idx]})" 
           "и #{array[data[:end_idx]]} (индекс #{data[:end_idx]})"
    else
      puts "Нет элементов для переворота между экстремумами"
    end

  rescue Errno::ENOENT
    puts "Ошибка: Файл array.txt не найден"
  rescue ArgumentError
    puts "Ошибка: Некорректные данные в файле"
  end
else
  puts "Некорректный выбор. Доступна только задача 1"
end