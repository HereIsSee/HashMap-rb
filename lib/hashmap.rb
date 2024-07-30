require_relative 'linked_list'

class HashMap

  def initialize
    @buckets = Array.new(16,LinkedList.new)
    @load_factor = 0.75
    @hash_map_size = 16
    @element_count = 0
  end

  def hash(key)
    hash_code = 0
    prime_number = 31
       
    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }
       
    hash_code
  end
 
  def set(key, value)
    index = hash(key) % @hash_map_size

    return @buckets[index].replace_value_with_same_key(key, value) if @buckets[index].contains?(key)

    @buckets[index].prepend(key, value)
  end

  def get(key)
    hash_code = hash(key) % @hash_map_size

    index = @buckets[hash_code].find(key)

    return @buckets[hash_code].at(index).value if !index.nil?
    nil
  end

  def has?(key)
    hash_code = hash(key) % @hash_map_size

    return true if @buckets[hash_code].contains?(key)

    false
  end

  def remove(key)
    hash_code = hash(key) % @hash_map_size

    index = @buckets[hash_code].find(key)

    if !index.nil?
      return @buckets[hash_code].remove_at(index) 
    end

    nil
  end

end

map = HashMap.new

{"something" => 34, "good" => 1,
  "for" => 123, "me" => 12222}.each do |key, value|
    # puts "#{key} : #{value}"
    map.set(key, value)
  end

p map.remove("bad")