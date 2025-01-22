require_relative 'student'
require_relative 'student_short'


begin
  student_string = "Иванов, Иван, Иванович, +7 123 456 78 90, @ivanov, ivanov@gmail.com, https://github.com/ivanov"
  student = Student.from_string(student_string)

  puts "Информация о студенте:"
  puts student.to_s
  puts "Краткая информация о студенте:"
  puts student.get_info


  puts "Наличие контактов: #{student.has_contact? ? 'Да' : 'Нет'}"
  puts "Наличие Git: #{student.has_git? ? 'Да' : 'Нет'}"


  student_short = Student_short.create_from_student(student)

  puts "\nИнформация о Student_short:"
  puts "ID: #{student_short.id}"
  puts "Фамилия и инициалы: #{student_short.surname_initials}"
  puts "Гит: #{student_short.git}"
  puts "Контакт: #{student_short.contact}"


  student_short_from_string = Student_short.create_from_string(student_string)
  puts "\nИнформация о Student_short из строки:"
  puts student_short_from_string.to_s

rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end