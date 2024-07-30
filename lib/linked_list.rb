require_relative 'node'

# and implemented linked list using ruby
class LinkedList
  attr_accessor :head, :tail

  def initialize(head = nil, tail = nil, pointer = head)
    @head = head
    @tail = tail
    @pointer = pointer
    @size = 0
  end

  def prepend(key, value)
    @size += 1
    @head = Node.new(key, value, @head)
  end

  def append(key, value)
    @size += 1
    if @head.nil?
      @head = Node.new(key, value, nil)
      @tail = @head
      return
    end
    @tail.next_node = Node.new(key, value, nil)
    @tail = @tail.next_node
    @head.value
  end

  attr_reader :size

  def at(index)
    @pointer = @head

    index.times do
      @pointer = @pointer.next_node
    end
    @pointer
  end

  def pop
    @pointer = @head

    (@size - 2).times do
      @pointer = @pointer.next_node
    end
    @size -= 1
    value = @pointer.next_node.value
    @pointer.next_node = nil
    value
  end

  def contains?(key)
    @pointer = @head
    until @pointer.nil?
      return true if @pointer.key == key

      @pointer = @pointer.next_node
    end
    false
  end

  def find(key)
    index = 0
    @pointer = @head
    until @pointer.nil?
      return index if @pointer.key == key

      @pointer = @pointer.next_node
      index += 1
    end
    nil
  end

  def replace_value_with_same_key(key, value)
    @pointer = @head
    until @pointer.nil?
      return @pointer.value = value if @pointer.key == key

      @pointer = @pointer.next_node
    end

  end

  def insert_at(key, value, index)
    if index == 0
      @head = Node.new(key, value, @head)
      return
    end
    return puts 'index out of bounds' if index >= @size

    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index - 1) == indicator
      @pointer = @pointer.next_node
    end
    temp.next_node = Node.new(key, value, @pointer)
    nil
  end

  def remove_at(index)
    return puts 'index out of bounds' if index >= @size
    
    value = nil
    if index == 0
      value = @head.value
      @head = @head.next_node
      return value
    end
    
    return pop if index == (@size - 1)

    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index - 1) == indicator
      @pointer = @pointer.next_node
    end
    value = @pointer.value
    temp.next_node = @pointer.next_node
    return value
  end

  def to_s
    string = ''
    @pointer = @head
    until @pointer.nil?
      string += "( #{@pointer.key} : #{@pointer.value} ) -> "
      @pointer = @pointer.next_node
    end
    string + 'nil'
  end
  
end