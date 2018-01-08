# There are many ways to implement these methods, feel free to add arguments
# to methods as you see fit, or to create helper methods.

require "bst_node"

class BinarySearchTree
  attr_reader :root

  def initialize
    @root = nil
    @count = 0

  end

  def insert(value)

    if @root.nil?
      @root = BSTNode.new(value)
      return
    end

    inserted = false

  current_node = @root
  while(inserted == false)
    if value <= current_node.value
      if current_node.left.nil?
        current_node.left = BSTNode.new(value)
        inserted = true
        @count += 1
      else
        current_node = current_node.left
      end

    else
      if current_node.right.nil?
        inserted = true
        current_node.right = BSTNode.new(value)
        @count += 1
      else
        current_node = current_node.right
      end

    end
  end
end

  def find(value, tree_node = @root)
    return nil if tree_node.nil?

    return tree_node if tree_node.value == value

    if value <= tree_node.value
        #search left sub-tree
        left_sub_tree = find(value, tree_node.left)

        return left_sub_tree if  !left_sub_tree.nil?


    else
        #search right sub-tree
        right_sub_tree = find(value, tree_node.right)

        return right_sub_tree if !right_sub_tree.nil?

    end

  end

  def delete(value)
       if value == @root.value
         @root = nil
         return
       end


      parent_node = find_parent(value, tree_node = @root)

      target_node = (parent_node.left.value == value) ? parent_node.left : parent_node.right



      if no_children(target_node)

        if(parent_node.right.value == value)
          parent_node.right = nil
        else
          parent_node.left = nil
        end

      elsif has_one_child(target_node)
        if target_node.left.nil?
          target_node = target_node.right
        else
          target_node = target_node.left
        end

        promote_node(parent_node,target_node)

      else
        max_left_sub_tree = maximum(target_node.left)
        max_left_sub_tree_parent_node = find_parent(max_left_sub_tree.value, tree_node = @root)

        promote_node_two_children(parent_node,target_node, max_left_sub_tree, max_left_sub_tree_parent_node)

      end






  end


  # helper method for #delete:

  def promote_node_two_children(parent_node,target_node, max_left_sub_tree, max_left_sub_tree_parent_node)

    if parent_node.value <= max_left_sub_tree.value
      parent_node.right = max_left_sub_tree
      promote_node(max_left_sub_tree_parent_node, max_left_sub_tree.left)


      max_left_sub_tree.left = target_node.left if !target_node.left.nil?

      max_left_sub_tree.right = target_node.right if !target_node.right.nil?






    else
      parent_node.left = max_left_sub_tree
      promote_node(max_left_sub_tree_parent_node, max_left_sub_tree.left)


      max_left_sub_tree.left = target_node.left if !target_node.left.nil?

      max_left_sub_tree.right = target_node.right if !target_node.right.nil?


    end

  end

  def maximum(tree_node = @root)
    return tree_node if tree_node.right.nil?

    maximum(tree_node.right)

  end

  def depth(tree_node = @root)

    return -1 if tree_node.nil?

    return (

      [1 + depth(tree_node.left), 1 + depth(tree_node.right)].max

    )
    # return(10)

  end

  def is_balanced?(tree_node = @root)
    left_depth = depth(tree_node.left)
    right_depth = depth(tree_node.right)
    height = depth(tree_node)

    return true if (left_depth-right_depth).abs <= 1 && height <= Math.log(@count,2)
    false

  end

  def in_order_traversal(tree_node = @root, arr = [])
    return if tree_node.nil?

    in_order_traversal(tree_node.left,arr)
    arr.push(tree_node.value)
    in_order_traversal(tree_node.right,arr)
    arr

  end


  private
  # optional helper methods go here:

  def no_children(node)
    return true if node.left.nil? && node.right.nil?
    false
  end

  def has_one_child(node)
    if node.left && node.right.nil? ||
     node.right && node.left.nil?
      return true
    else
      return false
    end

  end

  def promote_node(parent,target)
    if parent.value <= target.value
      parent.right = target
    else
      parent.left = target
    end
  end


  def find_parent(value,tree_node = @root)
    # print(value,tree_node.value)
    return nil if tree_node.nil?


    if tree_node.left.value == value || tree_node.right.value == value
      # print(value, ' ', tree_node.value, tree_node.left.value, tree_node.right.value)
      return tree_node
    end


    if value <= tree_node.value
        #search left sub-tree
        left_sub_tree = find_parent(value, tree_node.left)

        return left_sub_tree if  !left_sub_tree.nil?


    else
        #search right sub-tree
        right_sub_tree = find_parent(value, tree_node.right)

        return right_sub_tree if !right_sub_tree.nil?

    end
  end


end
