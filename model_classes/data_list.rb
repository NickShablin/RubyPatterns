class DataList
  def initialize(array)
    @data = deep_dup(array).freeze
    @selected_indices = []
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

  # (a) select(number) — выделить элемент по номеру (номер в 1-индексации).
  def select(number)
    index = number - 1
    if index < 0 || index >= @data.size
      raise ArgumentError, "Неверный номер элемента: #{number}"
    end
    @selected_indices << index unless @selected_indices.include?(index)
    self
  end

  # (b) get_selected — получить массив id выделенных элементов (id = индекс + 1).
  def get_selected
    @selected_indices.map { |i| i + 1 }
  end

  # (c) get_names — получить массив наименований атрибутов, кроме ID.
  def get_names
    raise NotImplementedError, "Метод get_names должен быть реализован в наследниках"
  end

  # (d) get_data — получить объект DataTable, где первый столбец — сгенерированный номер по порядку,
  # а остальные столбцы заполнены ВСЕМИ атрибутами сущности, кроме ID.
  # Этот метод также должен быть реализован в наследниках.
  def get_data
    raise NotImplementedError, "Метод get_data должен быть реализован в наследниках"
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
