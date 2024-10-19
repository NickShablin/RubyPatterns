class NumberOperations
  def initialize(number)
    @number = number
  end

  # Метод 1: Найти сумму непростых делителей числа
  def sum_neprost_del
    sum = 0
    (1..@number).each do |i|
      next if i > @number
      is_prost = true
      (2..Math.sqrt(i)).each do |j|
        is_prost = false if i % j == 0
        break if is_prost == false
      end
      sum += i if is_prost == false
    end
    sum
  end
  

	
  