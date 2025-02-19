class Report

  def generate_report
    data = gather_data        
    formatted_data = format_data(data)  
    print_report(formatted_data)        
  end


  def gather_data
    raise NotImplementedError, "Подкласс должен реализовать метод gather_data"
  end


  def format_data(data)
    data.join(", ")
  end


  def print_report(formatted_data)
    puts "Report: #{formatted_data}"
  end
end


class SalesReport < Report
  def gather_data
    [100, 200, 300]
  end

  def format_data(data)
    "Sales figures: " + data.map { |d| "$#{d}" }.join(", ")
  end
end

# Наследник для отчёта по запасам.
class InventoryReport < Report
  def gather_data
    ["Item A", "Item B", "Item C"]
  end

  def format_data(data)
    "Inventory items: " + data.join(" | ")
  end
end


puts "Sales Report:"
SalesReport.new.generate_report

puts "\nInventory Report:"
InventoryReport.new.generate_report
