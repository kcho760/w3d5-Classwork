require_relative "tree_node"

class KnightPathFinder
    attr_reader :root_node, :considered_position

    def self.valid_moves(pos)
        moves = []
        row, col = pos
        d = [[2, 1], [2, -1], [-2, 1], [-2, 1], [1, 2], [1, -2], [-1, 2], [-1, -2]]
        d.each do |distance|
            x = row + distance[0]
            y = col + distance[1]
            new_pos = [x, y]
            moves << new_pos if KnightPathFinder.valid_pos(new_pos)
        end
        moves
    end

    def self.valid_pos(pos)
        row, col = pos
        row.between?(0,7) && col.between?(0,7)
    end

    def initialize (pos)
        raise "invalid starting position" if !KnightPathFinder.valid_pos(pos)
        @root_node = PolyTreeNode.new(pos)
        @considered_position = [pos]
        build_move_tree(@root_node)
    end

    def new_move_pos(pos)
        new_arr = KnightPathFinder.valid_moves(pos)
        
        moves = new_arr.select {|move| !@considered_position.include?(move)}
        @considered_position += moves
        moves
    end
    def build_move_tree(root_node)
        return nil if root_node.nil?
        queue = []
        queue << root_node
        while !queue.empty?
            current_node = queue.shift
            positions = new_move_pos(current_node.value)
            positions.each do |child_val|
                new_child = PolyTreeNode.new(child_val)
                current_node.add_child(new_child)
                queue << new_child
            end
        end
    end
end