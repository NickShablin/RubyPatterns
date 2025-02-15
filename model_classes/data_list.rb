class DataList

  def initialize(array)
    @data = deep_dup(array).freeze
  end

  def element(index)
    @data[index]
  end

  def size
    @data.size
  end

  def all_elements
    @data.dup
  end


  def select(number)
    raise NotImplementedError, "Метод update в разработке..."
  end

  private


  def deep_dup(obj)
    if obj.is_a?(Array)
      obj.map { |e| deep_dup(e) }
    else
      obj
    end
  end
end
