require_relative 'array_processing'


def assert_equal(expected, actual, message = "")
  if expected == actual
    puts "Тест пройден: #{message}"
  else
    raise "Тест не пройден: #{message}\n  Ожидаемый результат: #{expected.inspect}\n Фактический результат:   #{actual.inspect}"
  end
end

def run_tests
  puts "Запуск тестов для ArrayProcessor..."

  arr = [1, 2, 3, 4, 5]
  processor = ArrayProcessor.new(arr)

  # Тест метода any?
  result = processor.any? { |n| n > 3 }
  assert_equal(true, result, "any? возвращает true, если найден элемент больше 3")

  result = processor.any? { |n| n > 5 }
  assert_equal(false, result, "any? возвращает false, если нет элемента больше 5")

end

run_tests