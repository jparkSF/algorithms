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
  end

  def remove(key)
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
