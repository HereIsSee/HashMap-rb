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

  def prepend(value, key)
    @size += 1
    @head = Node.new(value, key, @head)
  end

  def append(value, key)
    @size += 1
    if @head.nil?
      @head = Node.new(value, key, nil)
      @tail = @head
      return
    end
    @tail.next_node = Node.new(value, key, nil)
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
    @pointer.next_node = nil
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

  def insert_at(value, key, index)
    if index == 0
      @head = Node.new(value, key, @head)
      return
    end
    return puts 'index out of bounds' if index >= @size

    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index - 1) == indicator
      @pointer = @pointer.next_node
    end
    temp.next_node = Node.new(value, key, @pointer)
    nil
  end

  def remove_at(index)
    if index == 0
      @head = @head.next_node
      return
    end
    return puts 'index out of bounds' if index >= @size

    @pointer = @head
    temp = nil
    index.times do |indicator|
      temp = @pointer if (index - 1) == indicator
      @pointer = @pointer.next_node
    end
    temp.next_node = @pointer.next_node
    nil
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