class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BTreeSort
  def self.push_node(node, val)
    return Node.new(val) if node.nil?

    node.left  = push_node(node.left, val)  if val < node.value
    node.right = push_node(node.right, val) if val > node.value

    node
  end

  def self.recursive_sort(root, sorted=[])  
    return sorted if root.nil?
    
    recursive_sort(root.left, sorted)
    sorted.push(root.value)
    recursive_sort(root.right, sorted)
  end

  def self.sort(array)
    root = nil
    array.each { |value| root = push_node(root, value) }
    return recursive_sort(root)
  end
end
