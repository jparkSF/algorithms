require_relative "static_array"

class RingBuffer
  attr_reader :length

  def initialize
    self.store = Array.new(8)
    self.capacity = 8
    self.length = 0
    self.start_idx = 0
  end

  # O(1)
  def [](index)
    if (index >= 0) && (index < self.length)
      return self.store[(index + start_idx) % capacity]
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def []=(index, val)
    if (index >= 0) && (index < self.length)
      self.store[(index + start_idx) % capacity] = val
    else
      raise "index out of bounds"
    end
  end

  # O(1)
  def pop
    if length == 0
      raise "index out of bounds"
    else
    popped = self[length - 1]
    self[length - 1] = nil
    self.length -= 1

    popped
    end
  end

  # O(1) ammortized
  def push(val)
    if self.length == self.capacity
      resize!
    end
    self.length += 1
    self[length - 1] = val

  end

  # O(1)
  def shift
  end

  # O(1) ammortized
  def unshift(val)
  end

  protected
  attr_accessor :capacity, :start_idx, :store
  attr_writer :length

  def check_index(index)
  end

  def resize!
  end
end
