# 1.12 Переставить в обратном порядке элементы массива, расположенные между его минимальным и максимальным элементами.
def reverse_between_min_max(arr)
  return arr.dup if arr.empty? || arr.min == arr.max

  min_idx = arr.index(arr.min)
  max_idx = arr.rindex(arr.max)
  start, finish = [min_idx, max_idx].minmax

  arr[0..start] + arr[start+1...finish].reverse + arr[finish..-1]
end

# 1.24 Дан целочисленный массив. Необходимо найти два наибольших элемента.
def two_largest_elements(arr)
  return [] if arr.empty?
  arr.max(2)
end

# 1.36 Дан целочисленный массив. Необходимо найти максимальный нечетный элемент.
def max_odd_element(arr)
  arr.select(&:odd?).max
end

# 1.48 Для введенного списка построить список с номерами элемента, который повторяется наибольшее число раз.
def indices_of_most_frequent(arr)
  return [] if arr.empty?
  freq = arr.group_by { |x| x }
  most_freq_element, _ = freq.max_by { |_, v| v.size }
  arr.each_index.select { |i| arr[i] == most_freq_element }
end

# 1.60 Дан список. Построить массив из элементов, делящихся на свой номер (номер считается по порядку, начиная с 1) и встречающихся в исходном массиве 1 раз.
def unique_elements_divisible_by_position(arr)
  return [] if arr.empty?
  freq = arr.tally
  arr.map.with_index { |elem, index| { elem: elem, pos: index + 1 } }
     .select { |h| freq[h[:elem]] == 1 && h[:elem] % h[:pos] == 0 }
     .map { |h| h[:elem] }
end