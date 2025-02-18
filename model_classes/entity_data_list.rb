require_relative 'data_list'
require_relative 'data_table'

class EntityDataList < DataList
  def initialize(array, attribute_names)
    # attribute_names – массив наименований атрибутов (без ID)
    super(array)
    @attribute_names = attribute_names.freeze
  end

  # Метод get_names является шаблонным: вызывает приватный метод build_names.
  def get_names
    build_names
  end

  def get_data
    new_data = []
    @data.each_with_index do |row, index|
      new_row = [index + 1] + row[1..-1]
      new_data << new_row
    end
    DataTable.new(new_data)
  end

  private

  # Шаблонный метод для формирования массива наименований атрибутов.
  def build_names
    ["No"] + @attribute_names
  end
end
