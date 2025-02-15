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


  # выделить элемент по номеру 
  def select(number)
    index = number - 1
    if index < 0 || index >= @data.size
      raise ArgumentError, "Неверный номер элемента: #{number}"
    end
    @selected_indices << index unless @selected_indices.include?(index)
    self
  end

  # получить массив id выделенных элементов 
  def get_selected
    @selected_indices.map { |i| i + 1 }
  end

  # получить массив наименований атрибутов, кроме ID.
  def get_names
    raise NotImplementedError, "Метод get_names должен быть реализован в наследниках"
  end

  # получить объект класса DataTable, где нулевой столбец – сгенерированный номер по порядку,
  # а остальные столбцы – ВСЕ атрибуты сущности, кроме ID.
  # Этот метод не реализуется в базовом классе.
  def get_data
    raise NotImplementedError, "Метод get_data должен быть реализован в наследниках"
  end

  private

  # Рекурсивное глубокое копирование массива
  def deep_dup(obj)
    if obj.is_a?(Array)
      obj.map { |e| deep_dup(e) }
    else
      obj
    end
  end
end
