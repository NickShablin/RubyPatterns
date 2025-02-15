require_relative 'array_processing'

# Функция для проверки равенства и вывода сообщения
def assert_equal(expected, actual, message = "")
  if expected == actual
    puts "Тест пройден: #{message}"
  else
    raise "Тест не пройден: #{message}\n  Ожидаемый результат: #{expected.inspect}\n  Фактический результат: #{actual.inspect}"
  end
end

# Тестирование метода any?
def test_any
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.any? { |n| n > 3 }
  assert_equal(true, result, "any? возвращает true, если найден элемент больше 3")
  
  result = processor.any? { |n| n > 5 }
  assert_equal(false, result, "any? возвращает false, если нет элемента больше 5")
end

# Тестирование метода find_all
def test_find_all
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.find_all { |n| n.even? }
  assert_equal([2, 4], result, "find_all возвращает массив четных чисел для [1,2,3,4,5]")
  
  result = processor.find_all { |n| n > 5 }
  assert_equal([], result, "find_all возвращает пустой массив, если нет элементов больше 5")
end

def run_tests
  puts "Запуск тестов для ArrayProcessor..."
  test_any
  test_find_all
  
end

run_tests