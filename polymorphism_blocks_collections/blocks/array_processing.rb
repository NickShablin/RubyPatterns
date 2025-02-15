class ArrayProcessor

  def initialize(array)
    @array = array.dup.freeze
  end

  # Возвращает копию массива
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
end