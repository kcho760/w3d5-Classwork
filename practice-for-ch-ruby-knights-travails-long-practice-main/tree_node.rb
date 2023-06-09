class PolyTreeNode

    attr_reader :value,:parent, :children

    def initialize(value)
        @parent = nil
        @value = value
        @children = []
    end

    def parent=(new_parent)
        if new_parent == nil && @parent != nil
            @parent.children.delete(self)
        elsif
            new_parent != nil && @parent != nil
            @parent.children.delete(self)
            new_parent.children << self if !new_parent.children.include?(self)
        elsif new_parent != nil && @parent == nil
            new_parent.children << self if !new_parent.children.include?(self)
        end
        @parent = new_parent
    end

    def add_child(child_node)
        child_node.parent=(self)
    end

    def remove_child(child_node)
        raise "Not a child" unless @children.include?(child_node)
        child_node.parent= nil
    end

    def dfs(target_value)
        return self if target_value == self.value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = []
        queue << self
        while !queue.empty?
            node = queue.shift 
            if node.value == target_value
                return node
            else
                queue += node.children 
            end
        end
        nil
    end
end
