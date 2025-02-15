class DataTable

  def initialize(data)
    @data = deep_dup(data).freeze
  end
end