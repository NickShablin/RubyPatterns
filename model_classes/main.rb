require_relative 'data_table'
require_relative 'data_list'
require_relative 'entity_data_list'


table_data = [
  [1, "Alice", [10, 20], { active: true }],
  [2, "Bob",   [30, 40], { active: false }],
  [3, "Charlie",[50, 60], { active: true }]
]

attribute_names = ["Name", "Scores", "Status"]

entity_data_list = EntityDataList.new(table_data, attribute_names)

puts "Общее количество элементов: #{entity_data_list.size}"
puts "Все элементы: #{entity_data_list.all_elements.inspect}"

entity_data_list.select(2)
puts "\nВыделенные элементы (id): #{entity_data_list.get_selected.inspect}"

puts "\nНаименования атрибутов (без ID):"
puts entity_data_list.get_names.inspect

new_data_table = entity_data_list.get_data
puts "\nНовый объект DataTable:"
puts "Количество строк: #{new_data_table.rows_count}"
puts "Количество столбцов: #{new_data_table.cols_count}"

(0...new_data_table.rows_count).each do |i|
  row = (0...new_data_table.cols_count).map { |j| new_data_table.element(i, j) }
  puts "Строка #{i}: #{row.inspect}"
end
