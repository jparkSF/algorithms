require_relative 'p02_hashing'
require_relative 'p04_linked_list'
include Enumerable

def each(&block)

end
class HashMap
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)


    if include?(key)
      bucket(key).update(key,val)
    else
      if @count >= num_buckets
        resize!
      end
      bucket(key).append(key,val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).each do |node|
      return node.val if node.key == key
    end
    nil
  end

  def delete(key)
    removal = bucket(key).remove(key)

    @count -= 1 if removal

  end

  def each
    @store.each do |bucket|
     bucket.each { |link| yield [link.key, link.val] }
   end

  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup

    @store = Array.new(2*num_buckets) {LinkedList.new}
    @count = 0

    temp.each do |bucket|
      bucket.each { |link| set(link.key, link.val) }
    end

  end

  def bucket(key)
    @store[key.hash % num_buckets]
    # optional but useful; return the bucket corresponding to `key`
  end
end
