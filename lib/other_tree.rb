class TreeNode
  attr_accessor :left, :right, :val
  def initialize(val)
    self.val = val
  end
end

class BTreeSort
  def self.sort(array)
    head = generate_tree(array)
    traverse(head)
  end

  def self.generate_tree(array)
    head = nil
    head = insert(array.shift, head) until array.empty?
    head
  end

  def self.insert(val, head)
    return TreeNode.new(val) if head.nil?
    
    if val < head.val
      head.left = insert(val, head.left)
    else
      head.right = insert(val, head.right)
    end

    head
  end

  def self.traverse(head)
    return [] if head.nil?
    traverse(head.left) + [head.val] + traverse(head.right)
  end
end