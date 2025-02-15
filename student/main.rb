require_relative 'student'
require_relative 'student_short'

def main
  # Исправленная строка: 8 элементов, разделённых запятыми.
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
    puts "Фамилия и инициалы: #{student_short.surname_initials}"
    puts "Гит: #{student_short.git}"
    puts "Контакт: #{student_short.contact}"

  rescue ArgumentError => e
    puts "Ошибка: #{e.message}"
  end
end

main
