class Student
  # Определяем атрибуты с помощью attr_accessor
  attr_accessor :id, :surname, :name, :patronymic, :git
  attr_reader :phone, :telegram, :email

  # Конструктор, принимающий хэш
  def initialize(attributes = {})
    @id = attributes[:id]
    self.surname = attributes[:surname]
    self.name = attributes[:name]
    self.patronymic = attributes[:patronymic]
    self.phone = attributes[:phone]  # Используем сеттер для проверки
    self.telegram = attributes[:telegram]
    self.email = attributes[:email]
    self.git = attributes[:git]
  end

  # Новый конструктор, принимающий строку
  def self.from_string(student_string)
    # Разделяем строку на части
    parts = student_string.split(',').map(&:strip)

    # Проверка, что строка содержит как минимум 5 частей
    raise ArgumentError, "Недостаточно данных для создания студента" if parts.size < 5

    # Извлечение данные
    surname, name, patronymic = parts[0].split(' ')
    phone = parts[1]
    telegram = parts[2]
    email = parts[3]
    git = parts[4]

    # Вызов стандартного конструктора с параметрами
    new(
      surname: surname,
      name: name,
      patronymic: patronymic,
      phone: phone,
      telegram: telegram,
      email: email,
      git: git
    )
  end

  # Метод класса для проверки корректности телефонного номера
  def self.validate_phone(phone)
    phone.match?(/\A(\+\d{1,3}\s?)?\(?\d{3}\)?[-.\s]?\d{3}[-.\s]?\d{4}\z/)
  end

  # Метод класса для проверки корректности фамилии, имени и отчества
  def self.validate_name(name)
    name.match?(/\A[а-яА-ЯёЁa-zA-Z\s-]+\z/)
  end

  # Метод класса для проверки корректности email
  def self.validate_email(email)
    email.match?(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  # Метод класса для проверки корректности Telegram
  def self.validate_telegram(telegram)
    telegram.match?(/\A@\w+\z/)
  end

  # Метод класса для проверки корректности Git
  def self.validate_git(git)
    git.match?(/\Ahttps?:\/\/github\.com\/[\w\-]+\z/)
  end

  # Сеттеры с проверками
  def surname=(value)
    raise ArgumentError, "Недопустимая фамилия" unless self.class.validate_name(value)
    @surname = value
  end

  def name=(value)
    raise ArgumentError, "Недопустимое имя" unless self.class.validate_name(value)
    @name = value
  end

  def patronymic=(value)
    raise ArgumentError, "Недопустимое отчество" unless self.class.validate_name(value)
    @patronymic = value
  end

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

  def git=(value)
    raise ArgumentError, "Недопустимый Git" unless self.class.validate_git(value)
    @git = value
  end

  # Метод для установки контактов
  def set_contacts(contacts = {})
    contacts.each do |key, value|
      case key
      when :phone
        self.phone = value  # Сеттер для проверки
      when :telegram
        self.telegram = value  
      when :email
        self.email = value  
      else
        raise ArgumentError, "Недопустимый контакт: #{key}"
      end
    end
  end

  # Метод для проверки наличия Git
  def has_git?
    !@git.nil? && !@git.empty?
  end

  # Метод для проверки наличия любого контакта
  def has_contact?
    !@phone.nil? || !@telegram.nil? || !@email.nil?
  end

  # Метод для валидации
  def validate
    raise ArgumentError, "Отсутствует Git" unless has_git?
    raise ArgumentError, "Отсутствует контакт для связи" unless has_contact?
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

  # Метод для получения краткой информации о студенте
  def getInfo
    contact_info = if @phone
                     "Телефон: #{@phone}"
                   elsif @telegram
                     "Telegram: #{@telegram}"
                   elsif @email
                     "Email: #{@email}"
                   else
                     "Нет контактной информации"
                   end

    "#{@surname} #{initials} | Гит: #{@git || 'Нет'} | #{contact_info}"
  end

  # Метод для получения инициалов
  def initials
    "#{@name[0]}.#{@patronymic[0]}."
  end

  # Метод для получения фамилии
  def get_surname
    @surname
  end

  # Метод для получения ссылки на Git
  def get_git
    @git
  end

  # Метод для получения контактной информации
  def get_contact_info
    if @phone
      @phone
    elsif @telegram
      @telegram
    elsif @email
      @email
    else
      "Нет контактной информации"
    end
  end
end