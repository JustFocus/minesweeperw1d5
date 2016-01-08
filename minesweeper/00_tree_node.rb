class PolyTreeNode
  attr_reader  :value
  attr_accessor :children, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    @parent.children.delete(self) unless @parent.nil?
    @parent = parent_node
    @parent.children << self unless parent_node.nil?
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Hey I don't have that kid" unless @children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if @value == target_value
    @children.each do |child|
      result = child.dfs(target_value)
      return result if result
    end
    nil
  end

  def bfs(target_value)
    queue = []
    queue << self
    until queue.empty?
      current = queue.pop
      return current if current.value == target_value
      current.children.each do |child|
        queue.unshift(child)
      end
    end
    return nil
  end



end
