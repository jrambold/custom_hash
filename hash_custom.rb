require 'pry'
class HashCustom
  attr_reader :length
  def initialize(length=10)
    @length = length
    @array = [nil]*length
  end

  def put(key, value)
    node = Node.new(key,value)
    index = hash_method(key)
    if !@array[index]
      @array[index] = node
    else
      node_index = @array[index]
      while node_index.next
        if node_index.key == key
          # node_index.value = value
          return false
        end
        node_index = node_index.next
      end
      if node_index.key == key
        # node_index.value = value
        return false
      end
      node_index.next = node
    end
    value
  end

  def get(key)
    index = hash_method(key)
    node = @array[index]
    while node.next && node.key != key
      node = node.next
    end
    if node.key == key
      node.value
    else
      false
    end
  end

  def remove(key)
    index = hash_method(key)
    node = @array[index]
    if !node
      false
    else
      if node.key == key
        @array[index] = nil
        true
      else
        while node.next && node.next.key != key
          node = node.next
        end
        if node.next.key == key
          node.next = node.next.next
          true
        else
          false
        end
      end
    end
  end

  def keys
    array = []
    for i in 0..@array.length-1
      if @array[i]
        node = @array[i]
        while node.next
          array << node.key
          node = node.next
        end
        array << node.key
      end
    end
    array
  end

  def values
    array = []
    for i in 0..@array.length-1
      if @array[i]
        node = @array[i]
        while node.next
          array << node.value
          node = node.next
        end
        array << node.value
      end
    end
    array
  end

  def value?(value)
    for i in 0..@array.length-1
      if @array[i]
        node = @array[i]
        while node.next
          if node.value == value
            return true
          end
          node = node.next
        end
        array << node.value
      end
    end
    false
  end

  def print_hash
    for i in 0..@array.length-1
      print "#{i} -> "
      if @array[i]
        node = @array[i]
        while node.next
          print "#{node.key}, "
          node = node.next
        end
        print "#{node.key}"
      end
      puts ''
    end
  end

  private

  def hash_method(key)
    if key.class != String
      key = key.to_s
    end
    key.sum%length
  end

end

private

class Node
  attr_reader :key

  attr_accessor :next,
                :value

  def initialize(key, value)
    @key = key
    @value = value
    @next = nil
  end
end
