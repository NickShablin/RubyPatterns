class Student
  # Определяем атрибуты с помощью attr_accessor
  attr_accessor :id, :surname, :name, :patronymic, :phone, :telegram, :email, :git

  # Конструктор, принимающий хэш
  def initialize(attributes = {})
    @id = attributes[:id]
    @surname = attributes[:surname]
    @name = attributes[:name]
    @patronymic = attributes[:patronymic]
    @phone = attributes[:phone]
    @telegram = attributes[:telegram]
    @email = attributes[:email]
    @git = attributes[:git]
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