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

  # Сеттер для замены массива объектов.
  def data=(new_array)
    @data = deep_dup(new_array).freeze
    @selected_indices = []
  end

  # (a) Выделить элемент по номеру (номер в 1-индексации)
  def select(number)
    index = number - 1
    if index < 0 || index >= @data.size
      raise ArgumentError, "Неверный номер элемента: #{number}"
    end
    @selected_indices << index unless @selected_indices.include?(index)
    self
  end

  # (b) Получить массив id выделенных элементов (id = индекс + 1)
  def get_selected
    @selected_indices.map { |i| i + 1 }
  end

  # (c) Получить массив наименований атрибутов, кроме ID.
  def get_names
    raise NotImplementedError, "Метод get_names должен быть реализован в наследниках"
  end

  # (d) Получить объект DataTable, где первый столбец – сгенерированный номер,
  # а остальные столбцы – атрибуты сущности (без ID).
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
