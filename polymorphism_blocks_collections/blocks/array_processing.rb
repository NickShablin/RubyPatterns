class ArrayProcessor

  def initialize(array)
    @array = array.dup.freeze
  end

  def elements
    @array.dup
  end

  def any?
    raise LocalJumpError, "не передан блок" unless block_given?
    for elem in @array
      return true if yield(elem)
    end
    false
  end

  def find_all
    raise LocalJumpError, "не передан блок" unless block_given?
    result = []
    for elem in @array
      result << elem if yield(elem)
    end
    result
  end

  def find_index
    raise LocalJumpError, "не передан блок" unless block_given?
    index = 0
    for elem in @array
      return index if yield(elem)
      index += 1
    end
    nil
  end


  def min_max
    return [nil, nil] if @array.empty?
    min = @array[0]
    max = @array[0]
    for elem in @array
      min = elem if elem < min
      max = elem if elem > max
    end
    [min, max]
  end

   def none?
    raise LocalJumpError, "не передан блок" unless block_given?
    for elem in @array
      return false if yield(elem)
    end
    true
  end

  def reduce(initial = nil)
    raise LocalJumpError, "не передан блок" unless block_given?
    if initial.nil?
      raise "Empty array" if @array.empty?
      accumulator = @array[0]
      index = 1
      while index < @array.size
        accumulator = yield(accumulator, @array[index])
        index += 1
      end
    else
      accumulator = initial
      index = 0
      while index < @array.size
        accumulator = yield(accumulator, @array[index])
        index += 1
      end
    end
    accumulator
  end
end