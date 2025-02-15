class HtmlTag
  attr_reader :tag_name, :attributes, :content, :children

  def initialize(tag_name, attributes = {}, content = "")
    @tag_name = tag_name
    @attributes = attributes
    @content = content.strip
    @children = []
  end

  def add_child(child)
    @children << child
  end

  def get_string
    tag_name
  end

  def get_number
    attributes.size
  end

  def get_boolean
    !children.empty?
  end

  def to_s
    inner = content.empty? ? "" : content
    inner << children.map(&:to_s).join if children.any?
    "<#{tag_name}#{attributes_string}>#{inner}</#{tag_name}>"
  end

  private

  def attributes_string
    return "" if attributes.empty?
    " " + attributes.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
  end
end
