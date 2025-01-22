class Student_short
  attr_reader :surname_initials, :contact

  # Приватный инициализатор
  private_class_method :new

  def initialize(surname_initials, contact = nil)
    @surname_initials = surname_initials
    @contact = contact
  end

  def self.create_from_student(student)
    contact = student.has_contact? ? student.get_info : nil
    new("#{student.surname} #{student.name[0]}. #{student.patronymic[0]}.", contact)
  end

  def self.create_from_string(string)
    surname_initials, contact = string.split(';').map(&:strip)
    new(surname_initials, contact)
  end

  def to_s
    "#{surname_initials} (#{contact})"
  end

  def to_h
    { surname_initials: @surname_initials, contact: @contact }
  end

  def has_contact?
    !@contact.nil? && !@contact.empty?
  end

  def equal_to?(other)
    other.is_a?(Student_short) && @contact == other.contact
  end
end