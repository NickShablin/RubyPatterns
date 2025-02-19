require_relative 'data_list'
require_relative 'data_table'

class EntityDataList < DataList
  def initialize(array, attribute_names)
    super(array)
    @attribute_names = attribute_names.freeze
  end

  # (c) Метод get_names возвращает заголовки таблицы.
  def get_names
    build_names
  end

  # (d) Метод get_data формирует новый объект DataTable.

  def get_data
    new_data = build_data
    DataTable.new(new_data)
  end

  private


  def build_names
    ["No"] + @attribute_names
  end


  def build_data
    new_data = []
    @data.each_with_index do |entity, index|
      new_row = [build_generated_number(index)] + build_row_data(entity)
      new_data << new_row
    end
    new_data
  end


  def build_generated_number(index)
    index + 1
  end


  def build_row_data(entity)
    [entity.surname_initials, entity.git, entity.contact]
  end
end
