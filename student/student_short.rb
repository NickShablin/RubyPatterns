require_relative 'base_student'

class Student_short < BaseStudent
  attr_reader :surname_initials, :contact

  # Метод для создания объекта Student_short из объекта Student
  def self.create_from_student(student)
    new(
      id: student.id,
      git: student.git,
      surname_initials: "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}",
      contact: student.get_contact
    )
  end

  # Метод для сравнения объектов Student_short
  def ==(other)
    return false unless other.is_a?(Student_short)
    self.contact == other.contact
  end

  # Метод для создания объекта Student_short из строки
  def self.create_from_string(string)
    attributes = {}

    string.split(', ').each do |pair|
      key, value = pair.split(': ')
      attributes[key] = value
    end

    new(
      id: attributes['ID'],
      git: attributes['Git'],
      surname_initials: attributes['ФИО'],
      contact: attributes['Тел'] || attributes['Телеграм'] || attributes['Почта'] || nil
    )
  end

  # Метод для строкового представления Student_short
  def to_s
    "ID: #{@id}, ФИО: #{@surname_initials}, Git: #{@git || 'нет'}, Контакт: #{@contact || 'нет'}"
  end

  # Метод для получения данных в виде хэша
  def to_h
    { id: @id, surname_initials: @surname_initials, git: @git, contact: @contact }
  end
  
  # Метод для проверки наличия контактов
  def has_contact?
    !@contact.nil?
  end

  private_class_method :new
  
  # Конструктор
  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    @surname_initials = surname_initials
    @contact = contact
  end
end