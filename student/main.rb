require_relative 'student'

# Создание объектов Student
student1 = Student.new(id: 1, surname: "Иванов", name: "Иван", patronymic: "Иванович")
student2 = Student.new(id: 2, surname: "Петров", name: "Петр", patronymic: "Петрович", email: "petrov@example.com")
student3 = Student.new(id: 3, surname: "Сидоров", name: "Сидор", patronymic: "Сидорович", telegram: "@sidorov", git: "https://github.com/sidorov")

# Вывод информации о студентах
puts "Информация о студентах:"
puts student1.to_s
puts student2.to_s
puts student3.to_s