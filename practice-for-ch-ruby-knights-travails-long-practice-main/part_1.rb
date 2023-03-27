require_relative "tree_node"

class KnightPathFinder
    def self.valid_moves(pos)
        moves = []
        row, col = pos
        new_pos = [row + 2, col + 1 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row + 2, col - 1 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row - 2, col + 1 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row - 2, col - 1 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row + 1, col + 2 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row + 1, col - 2 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row - 1, col + 2 ]
        moves << new_pos if self.valid_pos(new_pos)
        new_pos = [row - 1, col - 2 ]
        moves << new_pos if self.valid_pos(new_pos)

        moves
    end

    def self.valid_pos(pos)
        row, col = pos
        row.between?(0,7) && col.between?(0,7)
    end

    def initialize (pos)
        raise "invalid starting position" if !KnightPathFinder.valid_pos(pos)
        @root_node = PolyTreeNode.new(pos)
        # self.build_move_tree(@root_node)
        @considered_position = pos
    end

    def new_move_pos(pos)
        new_arr = KnightPathFinder.valid_moves(pos)
        
        new_arr.select {|move| !@considered_position.include?(moves)}

    end
    def build_move_tree(node)
        queue = []
        queue << node

        
    end
end