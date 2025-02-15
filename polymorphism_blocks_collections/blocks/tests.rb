require_relative 'array_processing'

def assert_equal(expected, actual, message = "")
  if expected == actual
    puts "Тест пройден: #{message}"
  else
    raise "Тест не пройден: #{message}\n  Ожидаемый результат: #{expected.inspect}\n  Фактический результат: #{actual.inspect}"
  end
end


def test_any
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.any? { |n| n > 3 }
  assert_equal(true, result, "any? возвращает true, если найден элемент больше 3")
  
  result = processor.any? { |n| n > 5 }
  assert_equal(false, result, "any? возвращает false, если нет элемента больше 5")
end

def test_find_all
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.find_all { |n| n.even? }
  assert_equal([2, 4], result, "find_all возвращает массив четных чисел для [1,2,3,4,5]")
  
  result = processor.find_all { |n| n > 5 }
  assert_equal([], result, "find_all возвращает пустой массив, если нет элементов больше 5")
end

def test_find_index
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.find_index { |n| n == 3 }
  assert_equal(2, result, "find_index возвращает индекс элемента 3 (индексация с 0)")
  
  result = processor.find_index { |n| n > 5 }
  assert_equal(nil, result, "find_index возвращает nil, если ни один элемент не удовлетворяет условию")
end

def test_min_max
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.min_max
  assert_equal([1, 5], result, "min_max возвращает [1, 5] для массива [1,2,3,4,5]")
  
  empty_processor = ArrayProcessor.new([])
  result = empty_processor.min_max
  assert_equal([nil, nil], result, "min_max возвращает [nil, nil] для пустого массива")
end

def test_none
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.none? { |n| n < 0 }
  assert_equal(true, result, "none? возвращает true, если ни один элемент не меньше 0")
  
  result = processor.none? { |n| n.even? }
  assert_equal(false, result, "none? возвращает false, если хотя бы один элемент четный")
end

def test_reduce
  processor = ArrayProcessor.new([1, 2, 3, 4, 5])
  
  result = processor.reduce(1) { |acc, n| acc * n }
  assert_equal(120, result, "reduce с начальным значением 1 и умножением элементов возвращает 120")
  
  result = processor.reduce { |acc, n| acc + n } 
  assert_equal(15, result, "reduce без начального значения возвращает сумму элементов 15")
  
  begin
    ArrayProcessor.new([]).reduce { |acc, n| acc + n }
    raise "Тест не пройден: reduce без начального значения для пустого массива должен выбрасывать исключение"
  rescue => e
    puts "Тест пройден: reduce без начального значения для пустого массива выбрасывает исключение"
  end
end

def run_tests
  puts "Запуск тестов для ArrayProcessor..."
  test_any
  test_find_all
  test_find_index
  test_min_max
  test_none
  test_reduce
  
end

run_tests