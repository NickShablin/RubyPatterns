class ArrayProcessor

  def initialize(array)
    @array = array.dup.freeze
  end

  def elements
    @array.dup
  end


  # any? – возвращает true, если блок возвращает true для хотя бы одного элемента
  def any?
    raise LocalJumpError, "не передан блок" unless block_given?
    for elem in @array
      return true if yield(elem)
    end
    false
  end

  # find_all – возвращает массив всех элементов, для которых блок возвращает true
  def find_all
    raise LocalJumpError, "не передан блок" unless block_given?
    result = []
    for elem in @array
      result << elem if yield(elem)
    end
    result
  end

  # find_index – возвращает индекс первого элемента, для которого блок возвращает true, или nil, если ни один элемент не подходит
  def find_index
    raise LocalJumpError, "не передан блок" unless block_given?
    index = 0
    for elem in @array
      return index if yield(elem)
      index += 1
    end
    nil
  end
end