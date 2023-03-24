require_relative "tree_node"

class KnightPathFinder
    def self.valid_moves(pos)
        moves = []
        row, col = pos

        2.times do
            pos.each_index do |ele, i|
            case i
            when 0
                move << [row + 2, col + 1 ]
                move << [row + 2, col - 1 ]
                move << [row - 2, col + 1 ]
                move << [row - 2, col - 1 ]
            when 1
                move << [row + 1, col + 2 ]
                move << [row + 1, col - 2 ]
                move << [row - 1, col + 2 ]
                move << [row - 1, col - 2 ]
            end
    end

    def initialize (pos)
        @root_node = PolyTreeNode.new(pos)
        # self.build_move_tree(@root_node)
        @considered_position
    end

    def build_move_tree(node)

    end
end