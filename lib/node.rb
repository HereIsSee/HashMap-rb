# a node class
class Node
  attr_reader :value, :key, :next_node

  def initialize(value = nil, key = nil, next_node = nil)
    @value = value
    @key = key
    @next_node = next_node
  end
end