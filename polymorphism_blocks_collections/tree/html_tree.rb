require_relative 'html_tag'

class HtmlTree
  include Enumerable

  attr_reader :root

  def initialize(html)
    @html = html
    @root = parse_html
  end

  def each(&block)
    return to_enum(:each) unless block_given?
    traverse_depth(@root, &block)
  end

  def dfs(&block)
    return to_enum(:dfs) unless block_given?
    traverse_depth(@root, &block)
  end

  def breadth_each(&block)
    return to_enum(:breadth_each) unless block_given?
    queue = [@root]
    until queue.empty?
      node = queue.shift
      yield node
      queue.concat(node.children)
    end
  end

  private

  def traverse_depth(node, &block)
    return if node.nil?
    yield node
    node.children.each { |child| traverse_depth(child, &block) }
  end

  def parse_html
    stack = []
    pos = 0
    root_node = nil

    # Регулярное выражение для поиска тегов:
    # Г"/" если это закрывающий тег
    # имя тега
    # строка с атрибутами
    tag_regex = /<\s*(\/?)(\w+)([^>]*)>/

    while (match = tag_regex.match(@html, pos))
      # Извлекаем текст между тегами
      text = @html[pos...match.begin(0)]
      text = text.strip unless text.nil?

      if text && !text.empty? && !stack.empty?
        current = stack.last
        current.instance_variable_set(:@content, current.content + " " + text)
      end

      is_closing = match[1] == "/"
      tag_name = match[2]
      attr_str = match[3]

      if !is_closing
        attributes = parse_attributes(attr_str)
        node = HtmlTag.new(tag_name, attributes)
        stack.last.add_child(node) unless stack.empty?
        root_node ||= node
        stack.push(node)
      else
        stack.pop
      end

      pos = match.end(0)
    end

    root_node
  end

  def parse_attributes(attr_str)
    attributes = {}
    attr_regex = /(\w+)\s*=\s*"(.*?)"/
    attr_str.scan(attr_regex) do |key, value|
      attributes[key] = value
    end
    attributes
  end
end
