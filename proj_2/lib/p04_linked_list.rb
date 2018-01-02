class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil

  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous node to next node
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @count = 0
    @head = nil
    @tail = nil
  end

  def [](i)
    each_with_index { |node, j| return node if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    return true if @count == 0
    false
  end

  def get(key)
    node = @head

    count = 0
    while count < @count
    return if node == nil


      if node && node.key == key
        return node.val
      end
      node = node.next
      count += 1
    end

    return nil
  end

  def include?(key)
    node = get(key)
    return false if node == nil
    true

  end

  def append(key, val)
    #create a new node
    new_node = Node.new(key,val)
    @count += 1

    #if theres 1 node, then its first and last
    if @count == 1
      @head = new_node
      @tail = new_node
    else
      if @head == @tail
        @head.next = new_node
        new_node.prev = @head
        @tail = new_node
      else
        new_node.prev = @tail
        new_node.next = nil

        @tail.next = new_node

        @tail = new_node
      end


    end
  end

  def update(key, val)
    count = 0
    node = @head
    while count < @count
      if node.key == key
        node.val = val
        return
      end

    node = node.next
    end
  end

  def remove(key)
  end

  def each
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  # end
end
