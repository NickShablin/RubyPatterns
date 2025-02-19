require_relative 'student'
require_relative 'student_short'

def test_student_short_creation
  student_string = "1, Иванов, Иван, Иванович, +71234567890, @ivanov, ivanov@gmail.com, https://github.com/ivanov/my_repo.git"
  student = Student.from_string(student_string)
  student_short = StudentShort.create_from_student(student)
  
  puts "Создан StudentShort:"
  puts student_short.to_s
end

test_student_short_creation