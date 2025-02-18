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
    raise "Пустой массив" if @array.empty? && initial.nil?

    accumulator = initial || @array.first
    start_index = initial.nil? ? 1 : 0

    @array.drop(start_index).each do |element|
      accumulator = yield(accumulator, element)
    end

    accumulator
  end
end