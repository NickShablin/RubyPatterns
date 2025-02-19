# Базовый класс с шаблонным методом
class Report
  # Шаблонный метод, определяющий последовательность шагов алгоритма
  def generate_report
    data = gather_data        # шаг, специфичный для подкласса
    formatted_data = format_data(data)  # общий шаг (можно переопределить)
    print_report(formatted_data)        # общий шаг (можно переопределить)
  end

  # Абстрактный метод: сбор данных
  def gather_data
    raise NotImplementedError, "Подкласс должен реализовать метод gather_data"
  end

  # Метод форматирования данных: по умолчанию объединяем массив в строку
  def format_data(data)
    data.join(", ")
  end

  # Метод вывода отчёта: по умолчанию выводим в консоль
  def print_report(formatted_data)
    puts "Report: #{formatted_data}"
  end
end

# Наследник, реализующий конкретное поведение для отчёта по продажам
class SalesReport < Report
  # Реализация сбора данных: возвращает массив чисел
  def gather_data
    [100, 200, 300]
  end

  # Переопределяем форматирование: добавляем знак доллара
  def format_data(data)
    "Sales figures: " + data.map { |d| "$#{d}" }.join(", ")
  end
end

# Наследник, реализующий конкретное поведение для отчёта по запасам
class InventoryReport < Report
  def gather_data
    ["Item A", "Item B", "Item C"]
  end

  def format_data(data)
    "Inventory items: " + data.join(" | ")
  end
end

# Демонстрация работы
puts "Sales Report:"
sales_report = SalesReport.new
sales_report.generate_report

puts "\nInventory Report:"
inventory_report = InventoryReport.new
inventory_report.generate_report
