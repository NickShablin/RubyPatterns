require_relative 'student'
require_relative 'student_short'
require_relative 'data_table'
require_relative 'data_list'
require_relative 'data_list_student_short'
require_relative 'pattern_template_example'

def main
  student_string = "1, Иванов, Иван, Иванович, +71234567890, @ivanov, ivanov@gmail.com, https://github.com/ivanov/my_repo.git"
  
  begin
    student = Student.from_string(student_string)
    puts "Информация о студенте:"
    puts student.to_s
    puts "Краткая информация о студенте:"
    puts student.get_info
    puts "Наличие контактов: #{student.has_contact? ? 'Да' : 'Нет'}"
    puts "Наличие Git: #{student.has_git? ? 'Да' : 'Нет'}"

    student_short = StudentShort.create_from_student(student)
    puts "\nИнформация о StudentShort:"
    puts "ID: #{student_short.id}"
    puts "ФИО: #{student_short.surname_initials}"
    puts "Git: #{student_short.git}"
    puts "Контакт: #{student_short.contact}"

  rescue ArgumentError => e
    puts "Ошибка: #{e.message}"
  end

  table_data = [
    [1, "Alice", [10, 20], { active: true }],
    [2, "Bob", [30, 40], { active: false }],
    [3, "Charlie", [50, 60], { active: true }]
  ]
  data_table = DataTable.new(table_data)
  puts "\nDataTable:"
  puts "Количество строк: #{data_table.rows_count}"
  puts "Количество столбцов: #{data_table.cols_count}"
  (0...data_table.rows_count).each do |i|
    row = (0...data_table.cols_count).map { |j| data_table.element(i, j) }
    puts "Строка #{i}: #{row.inspect}"
  end


  student_short_array = []
  student_short_array << student_short
  student_short2 = StudentShort.create_from_student(
    Student.new(
      id: "2",
      surname_initials: "Петров",
      name: "Петр",
      patronymic: "Петрович",
      phone: "+71234567891",
      telegram: "@petrov",
      email: "petrov@gmail.com",
      git: "https://github.com/petrov/my_repo.git"
    )
  )
  student_short_array << student_short2

  data_list_student_short = DataListStudentShort.new(student_short_array)
  data_list_student_short.select(1)
  data_list_student_short.select(2)
  puts "\nDataListStudentShort:"
  puts "Выделенные элементы (id): #{data_list_student_short.get_selected.inspect}"
  puts "Наименования атрибутов: #{data_list_student_short.get_names.inspect}"
  new_data_table = data_list_student_short.get_data
  puts "Новый DataTable из DataListStudentShort:"
  puts "Количество строк: #{new_data_table.rows_count}"
  puts "Количество столбцов: #{new_data_table.cols_count}"
  (0...new_data_table.rows_count).each do |i|
    row = (0...new_data_table.cols_count).map { |j| new_data_table.element(i, j) }
    puts "Строка #{i}: #{row.inspect}"
  end

  puts "\nПаттерн 'Шаблонный метод' (Template Method) в действии:"
  # вывод в файле pattern_template_example.rb при его загрузке.
end

main
