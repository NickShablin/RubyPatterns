require_relative 'C:\Users\sl1pp\OneDrive\Документы\GitHub\RubyPatterns\base_student'

class StudentShort < BaseStudent
  attr_reader :surname_initials, :contact

  private_class_method :new

  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    @surname_initials = surname_initials
    @contact = contact
  end


  def self.create_from_student(student)
    surname_initials = "#{student.surname} #{student.name[0]}.#{student.patronymic ? " #{student.patronymic[0]}." : ''}"
    contact = student.has_contact? ? student.get_info : nil
    new(id: student.id, git: student.git, surname_initials: surname_initials, contact: contact)
  end


  def self.create_from_string(string)
    parts = string.split(',').map(&:strip)

    raise ArgumentError, "Недостаточно данных для создания StudentShort" if parts.size < 4

    id, git, surname_initials, contact = parts
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