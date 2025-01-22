require_relative 'student'
require_relative 'student_short'

# Тестирование нового конструктора Student_short
begin
  student_string = "Иванов Иван Иванович, +7 123 456 78 90, @ivanov, ivanov@gmail.com, https://github.com/ivanov"
  student = Student.from_string(student_string)

  # Создание объекта Student_short из объекта Student
  student_short = Student_short.new(student)

  puts "Информация о Student_short:"
  puts "ID: #{student_short.id}"
  puts "Фамилия и инициалы: #{student_short.surname_initials}"
  puts "Гит: #{student_short.git}"
  puts "Контакт: #{student_short.contact}"

  # Создание объекта Student_short из строки
  student_short_from_string = Student_short.create_from_string(student.id, student_string)
  puts "\nИнформация о Student_short из строки:"
  puts "ID: #{student_short_from_string.id}"
  puts "Фамилия и инициалы: #{student_short_from_string.surname_initials}"
  puts "Гит: #{student_short_from_string.git}"
  puts "Контакт: #{student_short_from_string.contact}"

rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end