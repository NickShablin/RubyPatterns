require_relative 'data_table'

table_data = [
  [1, "Alice", [10, 20], { active: true }],
  [2, "Bob", [30, 40], { active: false }],
  [3, "Charlie", [50, 60], { active: true }]
]

data_table = DataTable.new(table_data)

puts "Количество строк: #{data_table.rows_count}"
puts "Количество столбцов: #{data_table.cols_count}"

elem = data_table.element(1, 1)
puts "Элемент в строке 1, столбце 1: #{elem.inspect}"

if elem.respond_to?(:<<)
  begin
    elem << " Modified"
  rescue => e
    puts "Изменение элемента запрещено: #{e.message}"
  end
else
  puts "Элемент неизменяемый или не поддерживает модификацию."
end

elem2 = data_table.element(1, 1)
puts "Элемент в строке 1, столбце 1 после попытки изменения: #{elem2.inspect}"
