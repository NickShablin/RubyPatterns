class DataTable
  def initialize(data)
    @data = deep_dup(data).freeze
  end

  # Возвращает элемент по номеру строки и столбца (индексация с 0).
  def element(row, col)
    elem = @data[row][col]
    if elem.respond_to?(:dup)
      elem.dup.freeze
    else
      elem
    end
  end

  # Возвращает количество строк в таблице.
  def rows_count
    @data.size
  end

  # Возвращает количество столбцов в таблице.
  def cols_count
    @data.empty? ? 0 : @data.first.size
  end

  private

  # Рекурсивное копирование массива.
  def deep_dup(obj)
    if obj.is_a?(Array)
      obj.map { |e| deep_dup(e) }
    else
      obj
    end
  end
end
