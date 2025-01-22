require_relative 'student'

class Student_short
  attr_reader :id, :surname_initials, :git, :contact

  # Конструктор, принимающий объект класса Student
  def initialize(student)
    @id = student.id
    @surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}"
    @git = student.git
    @contact = student.get_contact_info
  end

  # Конструктор, принимающий ID и строку с информацией
  def self.create_from_string(id, student_string)
    parts = student_string.split(',').map(&:strip)

    raise ArgumentError, "Недостаточно данных для создания студента" if parts.size < 5

    surname, name, patronymic = parts[0].split(' ')
    phone = parts[1]
    telegram = parts[2]
    email = parts[3]
    git = parts[4]

    # Создаем временный объект Student для извлечения данных
    temp_student = Student.new(
      surname: surname,
      name: name,
      patronymic: patronymic,
      phone: phone,
      telegram: telegram,
      email: email,
      git: git
    )

    # Используем первый конструктор
    new(temp_student)
  end

  # Метод для получения краткой информации о студенте
  def getInfo
    "ID: #{@id}, ФИО: #{@surname_initials}, Git: #{@git || 'нет'}, Контакт: #{@contact || 'нет'}"
  end

  def to_s
    getInfo
  end

  def has_contact?
    !@contact.nil?
  end
end