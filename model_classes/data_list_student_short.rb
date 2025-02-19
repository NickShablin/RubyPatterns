require_relative 'data_list'
require_relative 'data_table'

class DataListStudentShort < DataList
  def initialize(array)
    super(array)
  end

  # (c) Реализация get_names: вызываем приватный метод build_names.
  def get_names
    build_names
  end

  # (d) Реализация get_data: формирует таблицу, где первый столбец — порядковый номер,
  # а остальные столбцы — атрибуты: фамилия и инициалы, Git и контакт.
  def get_data
    new_data = []
    @data.each_with_index do |student, index|
      new_row = [index + 1, student.surname_initials, student.git, student.contact]
      new_data << new_row
    end
    DataTable.new(new_data)
  end

  private

  def build_names
    ["No", "ФИО", "Git", "Контакт"]
  end
end
