class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @store = []
    @count = 0
    @prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    # @prc = prc
  end

  def count
    @count
  end

  def extract
    val = @store[0]
    @store[0], @store[@store.length-1] =  @store[@store.length-1], @store[0]
    @store.delete(@store[@store.length-1])
    BinaryMinHeap.heapify_down(@store, 0)
    val
  end

  def peek
  end

  def push(val)
    @store.push(val)
    BinaryMinHeap.heapify_up(@store, @store.length-1)
  end

  public
  def self.child_indices(len, parent_index)
    left_child = (parent_index * 2) + 1
    right_child = (parent_index * 2) + 2

    if left_child < len && right_child < len
      return [left_child,right_child]
    elsif left_child < len && right_child >= len
      return [left_child]
    else
      []
    end
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    return (child_index - 1) / 2
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
    prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    swapped = true

    while swapped
      children = BinaryMinHeap.child_indices(len,parent_idx)

      swapped = false
      children.each_with_index do |child_idx, other_idx|

        other_child_idx = other_idx == 0? 1: 0

         if prc.call(array[parent_idx],array[child_idx]) == 1 && children.length == 1 || prc.call(array[parent_idx],array[child_idx]) == 1 && prc.call(array[child_idx], array[children[other_child_idx]]) == -1
           temp = array[parent_idx]
           array[parent_idx] = array[child_idx]
           array[child_idx] = temp

           parent_idx = child_idx
           swapped = true

           break
         end
      end
    end

    array
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
    prc = prc ? prc : Proc.new {|el1, el2| el1 <=> el2}
    swapped = true

    while swapped && child_idx != 0
      swapped = false

      parent_idx = BinaryMinHeap.parent_index(child_idx)

      if prc.call(array[parent_idx], array[child_idx]) == 1
        temp = array[parent_idx]
        array[parent_idx] = array[child_idx]
        array[child_idx] = temp

        child_idx = parent_idx

        swapped = true
      end


    end

     array

  end
end
