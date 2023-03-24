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

end
