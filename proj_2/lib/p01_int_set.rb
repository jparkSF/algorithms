class MaxIntSet
  def initialize(max)
    @max = max
    @store = Array.new(@max)
  end

  def insert(num)
    if (num <= @max && num >= 0 && !include?(num))
      @store.push(num)
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    @store.delete(num)
  end

  def include?(num)
    @store.each do |el|
      return true if el == num
    end

    false
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num) if !include?(num)
  end

  def remove(num)
    self[num].each do |el|
      self[num].delete(el) if el == num
    end
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
