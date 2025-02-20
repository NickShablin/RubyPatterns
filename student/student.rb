require_relative 'base_student'

class Student < BaseStudent
  attr_accessor :surname_initials, :name, :patronymic, :git
  attr_reader :phone, :telegram, :email


  def initialize(attributes = {})
    super(id: attributes[:id], git: attributes[:git])
    self.surname_initials = attributes[:surname_initials]
    self.name = attributes[:name]
    self.patronymic = attributes[:patronymic]
    self.phone = attributes[:phone]  
    self.telegram = attributes[:telegram]
    self.email = attributes[:email]
  end

  def self.from_string(student_string)
    parts = student_string.split(',').map(&:strip)

    raise ArgumentError, "Недостаточно данных для создания студента" if parts.size < 8

    id, surname_initials, name, patronymic, phone, telegram, email, git = parts

    raise ArgumentError, "Фамилия и имя не могут быть пустыми" if surname_initials.empty? || name.empty?

    new(
      id: id,
      surname_initials: surname_initials,
      name: name,
      patronymic: patronymic,
      phone: phone,
      telegram: telegram,
      email: email,
      git: git
    )
  end


  def self.validate_name(name)
    name.match?(/\A[а-яА-ЯёЁa-zA-Z\s-]+\z/)
  end


  def self.validate_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end


  def self.validate_email(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end


  def self.validate_telegram(telegram)
    telegram.match?(/\A@\w+\z/)
  end

  def surname_initials=(value)
    raise ArgumentError, "Недопустимая фамилия" unless self.class.validate_name(value)
    @surname_initials = value
  end

  def name=(value)
    raise ArgumentError, "Недопустимое имя" unless self.class.validate_name(value)
    @name = value
  end

  def patronymic=(value)
    raise ArgumentError, "Недопустимое отчество" unless self.class.validate_name(value)
    @patronymic = value
  end

  def set_contacts(contacts = {})
    contacts.each do |key, value|
      case key
      when :phone
        self.phone = value  
      when :telegram
        self.telegram = value  
      when :email
        self.email = value
      else
        raise ArgumentError, "Недопустимый контакт: #{key}"
      end
    end
  end

  def has_contact?
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end

  def contact
    @phone || @telegram || @email
  end

  def get_info
    " ID: #{@id}, ФИО: #{@surname_initials} #{@name[0]}.#{@patronymic ? " #{@patronymic[0]}." : ''}, " \
    "Телефон: #{@phone || 'нет'}, Телеграм: #{@telegram || 'нет'}, " \
    "Почта: #{@email || 'нет'}, Git: #{@git || 'нет'}"
  end

  def to_s
    "ID: #{@id}, Фамилия: #{@surname_initials}, Имя: #{@name}, Отчество: #{@patronymic}, " \
    "Телефон: #{@phone}, Телеграм: #{@telegram}, Почта: #{@email}, Git: #{@git}"
  end

  private

  def phone=(value)
    raise ArgumentError, "Недопустимый номер телефона" unless self.class.validate_phone(value)
    @phone = value
  end

  def telegram=(value)
    raise ArgumentError, "Недопустимый Telegram" unless self.class.validate_telegram(value)
    @telegram = value
  end

  def email=(value)
    raise ArgumentError, "Недопустимый email" unless self.class.validate_email(value)
    @email = value
  end
end