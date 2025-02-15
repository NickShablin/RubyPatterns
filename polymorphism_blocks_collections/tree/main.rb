require_relative 'html_tree'

html = "<html>
  <body>
    <div class=\"container\">
      <p>Hello, World!</p>
      <span>Sample Text</span>
    </div>
    <footer>Footer content</footer>
  </body>
</html>"

tree = HtmlTree.new(html)

puts "Обход дерева в глубину (DFS) через метод dfs:"
tree.dfs do |node|
  puts "Tag: #{node.get_string}, Атрибутов: #{node.get_number}, Есть дочерние: #{node.get_boolean}"
end

puts "\nОбход дерева в глубину (DFS) через метод each (Enumerable):"
tree.each do |node|
  puts "Tag: #{node.get_string}, Атрибутов: #{node.get_number}, Есть дочерние: #{node.get_boolean}"
end

puts "\nОбход дерева в ширину (BFS) через метод breadth_each:"
tree.breadth_each do |node|
  puts "Tag: #{node.get_string}, Атрибутов: #{node.get_number}, Есть дочерние: #{node.get_boolean}"
end
