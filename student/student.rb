class Student
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

  # Геттеры
  def get_id
    @id
  end

  def get_surname
    @surname
  end

  def get_name
    @name
  end

  def get_patronymic
    @patronymic
  end

  def get_phone
    @phone
  end

  def get_telegram
    @telegram
  end

  def get_email
    @email
  end

  def get_git
    @git
  end

  # Сеттеры
  def set_id(value)
    @id = value
  end

  def set_surname(value)
    @surname = value
  end

  def set_name(value)
    @name = value
  end

  def set_patronymic(value)
    @patronymic = value
  end

  def set_phone(value)
    @phone = value
  end

  def set_telegram(value)
    @telegram = value
  end

  def set_email(value)
    @email = value
  end

  def set_git(value)
    @git = value
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