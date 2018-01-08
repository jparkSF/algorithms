require "binary_search_tree"

def kth_largest(tree_node, k)
  # p tree_node
  temp = BinarySearchTree.new()
  value =  temp.in_order_traversal(tree_node,[])[-k]

   temp.find(value, tree_node)

end
