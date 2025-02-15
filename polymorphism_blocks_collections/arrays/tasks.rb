#1.12 Переставить в обратном порядке элементы массива, расположенные между его минимальным и максимальным элементами.
def reverse_between_min_max(array)
  return array.dup if array.empty?

  min_val = array.min
  max_val = array.max
  return array.dup if min_val == max_val

  min_index = array.index(min_val)
  max_index = array.rindex(max_val)
  start_idx, end_idx = [min_index, max_index].minmax

  modified = array.dup
  modified[start_idx+1...end_idx] = modified[start_idx+1...end_idx].reverse if start_idx+1 < end_idx
  
  {result: modified, start_idx: start_idx, end_idx: end_idx}
end