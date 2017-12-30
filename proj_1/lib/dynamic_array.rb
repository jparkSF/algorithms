require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @arr = Array.new(0)
    @capacity = 8
  end

  # O(1)
  def [](index)
    @arr.length
  end

  # O(1)
  def []=(index, value)
    if @arr.length > index 
      @arr[index]
    else 
      raise 'index out of bounds'
    end 
  end

  # O(1)
  def pop
    if @arr.length > 0
      @arr.pop()
    else 
      raise "index out of bounds"
    end 
  end

  # O(1) ammortized; O(n) worst case. Variable because of the possible
  # resize.
  def push(val)
    @arr.push(val)
    if @arr.length > @capacity
      resize!
    end 
  end

  # O(n): has to shift over all the elements.
  def shift
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
  end
end
