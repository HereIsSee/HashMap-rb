require_relative 'linked_list'

class HashMap

  def initialize
    @buckets = Array.new(16) {LinkedList.new}
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
 
  def update_hashmap
    
  end

  def set(key, value)
    index = hash(key) % @hash_map_size
    
    if @buckets[index].contains?(key)
      return @buckets[index].replace_value_with_same_key(key, value) 
    end
    @element_count += 1
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
      @element_count -= 1
      return @buckets[hash_code].remove_at(index) 
    end

    nil
  end

  def length
    @element_count
  end

  def clear
    @buckets = Array.new(16,LinkedList.new)
    @load_factor = 0.75
    @hash_map_size = 16
    @element_count = 0
  end
  
  def keys
    collect_from_buckets(&:keys_to_array)
  end

  def values
    collect_from_buckets(&:values_to_array)
  end

  def entries
    collect_from_buckets(&:entries_to_array)
  end

  private

  def collect_from_buckets
    array = Array.new

    @buckets.each do |bucket|
      array.concat(yield bucket)
    end

    array
  end

end

map = HashMap.new

{"something" => 34, "good" => 1,
  "for" => 123, "me" => 12222}.each do |key, value|
    # puts "#{key} : #{value}"
    map.set(key, value)
  end
map.set("keys", 908)

p map.keys
p map.values
p map.entries
map.clear
p map.length