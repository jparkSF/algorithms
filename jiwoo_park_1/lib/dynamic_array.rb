require_relative "static_array"

class DynamicArray
  attr_reader :length

  def initialize
    @arr = Array.new(0)
    @capacity = 8
  end
  
  def length
    @arr.length
  end


  # O(1)
  def [](index)
    if @arr.length > index 
      @arr[index]
    else 
      raise 'index out of bounds'
    end 
  end

  # O(1)
  def []=(index, value)
    @arr[index] = value
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
    if @arr.length > 0
      @arr.shift()
    else 
      raise "index out of bounds"
    end 
  end

  # O(n): has to shift over all the elements.
  def unshift(val)
    @arr.unshift(val)
  end

  protected
  attr_accessor :capacity, :store
  attr_writer :length

  def check_index(index)
  end

  # O(n): has to copy over all the elements to the new store.
  def resize!
    @capacity = @capacity * 2
    @store = Array.new(@capacity)
    @store.concat(@arr)
  end
end
