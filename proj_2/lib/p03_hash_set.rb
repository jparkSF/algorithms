require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    bucket_to_be_inserted = (key.class.hash % num_buckets)
    if !include?(key)
      self[bucket_to_be_inserted].push(key)
      @count += 1

      if @count == num_buckets
        resize!
      end
      return true
    end

    false
  end

  def include?(key)
    bucket = (key.class.hash % num_buckets)
    self[bucket].each do |el|
      return true if key == el
    end
    false
  end

  def remove(key)
    bucket = (key.class.hash % num_buckets)
    self[bucket].each do |el|
      if el == key
        @count -= 1
        self[bucket].delete(el)
      end
    end
  end

  private

  def [](num)
    @store[num % num_buckets]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(2*num_buckets) {Array.new}
    @count = 0

    temp.each do |bucket|

      bucket.each do |el|
        insert(el)
      end

    end

  end
end
