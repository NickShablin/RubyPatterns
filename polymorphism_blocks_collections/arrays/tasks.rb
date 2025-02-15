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
