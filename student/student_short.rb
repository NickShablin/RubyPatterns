require_relative 'base_student.rb'

class Student_short < BaseStudent
  attr_reader :surname_initials, :contact

 
  private_class_method :new

  # Конструктор из объекта Student
  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    @surname_initials = surname_initials
    @contact = contact
  end

  # Создание из объекта Student
  def self.create_from_student(student)
    surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}"
    contact = student.has_contact? ? student.get_info : nil
    new(id: student.id, git: student.git, surname_initials: surname_initials, contact: contact)
  end

# Создание из строки
def self.create_from_string(string)
  id, git, surname_initials, contact = string.split(', ').map(&:strip)
  new(
    id: id,
    git: git,
    surname_initials: surname_initials,
    contact: contact
  )
end

  def to_s
    "ID: #{@id}, ФИО: #{@surname_initials}, Git: #{@git || 'нет'}, Контакт: #{@contact || 'нет'}"
  end

  def to_h
    { id: @id, surname_initials: @surname_initials, git: @git, contact: @contact }
  end

  def has_contact?
    !@contact.nil? && !@contact.empty?
  end
end