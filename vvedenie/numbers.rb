# Метод 1: Найти сумму непростых делителей числа
def sum_non_prime_divisors(n)
  def prime?(num)
    return false if num <= 1
    (2..Math.sqrt(num).to_i).none? { |i| num % i == 0 }
  end

  (1..n).select { |i| n % i == 0 && !prime?(i) }.sum
end


# Метод 2: Найти количество цифр числа, меньших 3
def count_digits_less_than_3(n)
  n.to_s.chars.count { |digit| digit.to_i < 3 }
end


# Метод 3: Найти количество чисел, не являющихся делителями исходного числа,
# не взаимно простых с ним и взаимно простых с суммой простых цифр числа
def count_special_numbers(n)
  def gcd(a, b)
    b == 0 ? a : gcd(b, a % b)
  end

  prime_digits = [2, 3, 5, 7]
  sum_prime_digits = n.to_s.chars.map(&:to_i).select { |digit| prime_digits.include?(digit) }.sum

  (1...n).reject { |x| n % x == 0 }
         .select { |x| gcd(x, n) != 1 && gcd(x, sum_prime_digits) == 1 }
         .size
end

n = 12
puts "Метод 1: Сумма непростых делителей числа #{n}: #{sum_non_prime_divisors(n)}"
puts "Метод 2: Количество цифр числа #{n}, меньших 3: #{count_digits_less_than_3(n)}"
puts "Метод 3: Количество специальных чисел для, не являющихся делителями исходного числа,
	не взаимно простых с ним и взаимно простых с суммой простых цифр числа #{n}: #{count_special_numbers(n)}"
