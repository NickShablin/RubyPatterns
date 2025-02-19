require_relative 'base_student'

class StudentShort < BaseStudent
  attr_reader :surname_initials, :contact

  private_class_method :new

  def initialize(id:, git:, surname_initials:, contact: nil)
    super(id: id, git: git)
    @surname_initials = surname_initials
    @contact = contact
  end

  def self.create_from_student(student)
    new(id: student.id, git: student.git, surname_initials: student.surname_initials, contact: student.contact)
  end

  def self.create_from_string(string)
    surname_initials, contact, git = string.split(', ')
    [surname_initials, contact, git]
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
