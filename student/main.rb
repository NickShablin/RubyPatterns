require_relative 'student'

# Тестирование нового конструктора
begin
  student_string = "Иванов Иван Иванович, +7 123 456 78 90, @ivanov, ivanov@example.com, https://github.com/ivanov"
  student = Student.from_string(student_string)

  puts "Информация о студенте:"
  puts student.to_s
rescue ArgumentError => e
  puts "Ошибка: #{e.message}"
end