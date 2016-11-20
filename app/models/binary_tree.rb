class BinaryNode
  attr_accessor :element, :left, :right
  def initialize(element, left=nil, right=nil)
    @element = element
    @left = left
    @right = right
  end

  def compare_with_node x
   return -1 if self.element < x
   return 1 if self.element > x
   return 0 if self.element == x
  end
end


class BinaryTree < ActiveRecord::Base

  def initialize
    @root = nil
  end

  def find_min(binary_node=nil)
    unless binary_node
      binary_node = @root
    end

    return nil unless binary_node
    return binary_node.element unless binary_node.left
    return self.find_min(binary_node.element)
  end

  def find_max(binary_node=nil)
    unless binary_node
      binary_node = @root
    end

    if binary_node
      while binary_node.right
        binary_node = binary_node.right
      end
    end
    return binary_node.element
  end

  def is_empty
    return true unless @root
    return false
  end

  def insert(x, binary_node=nil)
    unless binary_node
      binary_node = @root = BinaryNode.new(x, nil, nil)
    end

    if binary_node.compare_with_node(x) < 0
      self.insert(x, binary_node.left)
    end

    if binary_node.compare_with_node(x) > 0
      self.insert(x, binary_node.right)
    end

  end

  def remove x
  end
end

class BinaryHeap
end

