class Student
  # Определяем атрибуты с помощью attr_accessor
  attr_accessor :phone, :telegram, :email, :git
  attr_reader :id, :surname, :name, :patronymic

  # Конструктор
  def initialize(id:, surname:, name:, patronymic:, phone: nil, telegram: nil, email: nil, git: nil)
    @id = id
    @surname = surname
    @name = name
    @patronymic = patronymic
    @phone = phone
    @telegram = telegram
    @email = email
    @git = git
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