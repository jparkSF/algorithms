class BinaryMinHeap
  attr_reader :store, :prc

  def initialize(&prc)
    @heap = []
  end

  def count
    @heap.length
  end

  def extract
  end

  def peek
    @heap[0]
  end

  def push(val)
    @heap.push(val)
  end

  public
  def self.child_indices(len, parent_index)

    children = []
    if 2*parent_index+1 < len
      children.push(2*parent_index+1)
    end

    if 2*parent_index+2 < len
      children.push(2*parent_index+2)
    end

    children
  end

  def self.parent_index(child_index)
    raise "root has no parent" if child_index == 0
    parent_index = nil

    if child_index.even?
      parent_index = (child_index-2)/2
    else
      parent_index = (child_index-1)/2
    end

    parent_index
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)

    smaller_node = nil
    larger_node = nil
    parent_node = parent_idx

    swapped = true

    while swapped
      swapped = false

      child_nodes = BinaryMinHeap.child_indices(len,parent_node)
      unless child_nodes.first.nil? || child_nodes.last.nil?

        if array[child_nodes.first] < array[child_nodes.last]
          smaller_node = child_nodes.first
          larger_node = child_nodes.last
        else
          smaller_node = child_nodes.last
          larger_node = child_nodes.first
        end

        if !prc
          if array[parent_node] > array[smaller_node]
            array[parent_node],array[smaller_node] = array[smaller_node],array[parent_node]
            swapped = true
            parent_node = smaller_node
          end
        else
          if array[parent_node] < array[larger_node]
            array[larger_node],array[parent_node] = array[parent_node],array[larger_node]
            swapped = true
            parent_node = larger_node
          end
        end
      end


    end

    array

  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
