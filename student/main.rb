require_relative 'student'
require_relative 'student_short'

def main
  student_string = "1, Иванов Иван Иванович, +71234567890, @ivanov, ivanov@gmail.com, https://github.com/ivanov"
  
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
    puts "Фамилия и инициалы: #{student_short.surname_initials}"
    puts "Гит: #{student_short.git}"
    puts "Контакт: #{student_short.contact}"

    student_short_from_string = StudentShort.create_from_string(student_string)
    puts "\nИнформация о StudentShort из строки:"
    puts student_short_from_string.to_s

  rescue ArgumentError => e
    puts "Ошибка: #{e.message}"
  end
end
