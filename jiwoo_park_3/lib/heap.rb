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
    @heal.push(val)
  end

  public
  def self.child_indices(len, parent_index)

  end

  def self.parent_index(child_index)
  end

  def self.heapify_down(array, parent_idx, len = array.length, &prc)
  end

  def self.heapify_up(array, child_idx, len = array.length, &prc)
  end
end
