class DataTable

  def initialize(data)
    @data = deep_dup(data).freeze
  end


  def element(row, col)
    elem = @data[row][col]
    if elem.respond_to?(:dup)
      elem.dup.freeze
    else
      elem
    end
  end


  def rows_count
    @data.size
  end


  def cols_count
    @data.empty? ? 0 : @data.first.size
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
