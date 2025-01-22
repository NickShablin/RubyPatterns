require_relative 'student'

# Тестирование нового конструктора
begin
  student_string = "Иванов Иван Иванович, +7 123 456 78 90, @ivanov, ivanov@gmail.com, https://github.com/ivanov"
  student = Student.from_string(student_string)

  puts "Информация о студенте:"
  puts student.to_s

  # Получение краткой информации
  puts "Краткая информация о студенте:"
  puts student.getInfo

  # Получение отдельных значений
  puts "Фамилия: #{student.get_surname}"
  puts "Инициалы: #{student.initials}"
  puts "Git: #{student.get_git}"
  puts "Контактная информация: #{student.get_contact_info}"
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end