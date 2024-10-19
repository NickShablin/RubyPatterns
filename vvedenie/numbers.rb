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
  
   # Метод 2: Найти количество цифр числа, меньших 3
 def num_of_cifr_less3
	count = 0
    (@number.to_s).chars.map(&:to_i).each do |digit|
      count += 1 if digit < 3
    end
    count
  end
  

	
  