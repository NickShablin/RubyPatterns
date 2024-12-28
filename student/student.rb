class Student
  # Определяем атрибуты с помощью attr_accessor
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор, принимающий хэш
  def initialize(attributes = {})
    @id = attributes[:id]
    @surname = attributes[:surname]
    @name = attributes[:name]
    @patronymic = attributes[:patronymic]
    self.phone = attributes[:phone]  # Используем сеттер для проверки
    @telegram = attributes[:telegram]
    @email = attributes[:email]
    @git = attributes[:git]
  end

  # Метод класса для проверки корректности телефонного номера
  def self.validate_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

  # Сеттер для phone с проверкой
  def phone=(value)
    raise ArgumentError, "Недопустимый номер телефона" unless self.class.validate_phone(value)
    @phone = value
  end

  # Метод для вывода информации о студенте
  def to_s
    info = "ID: #{@id}, Фамилия: #{@surname}, Имя: #{@name}, Отчество: #{@patronymic}"
    info += ", Телефон: #{@phone}" if @phone
    info += ", Телеграм: #{@telegram}" if @telegram
    info += ", Почта: #{@email}" if @email
    info += ", Гит: #{@git}" if @git
    info
  end
end