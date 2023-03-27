require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos= prev_move_pos
  end

  def losing_node?(evaluator)
    # return true if child.board.winner == @next_mover_mark

    children.each do |child|
      if child.board.winner == evaluator
        return true
      end
    end
    false
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    next_move = []
    pot_positions = @board.open_positions
    pot_positions.each do |pot_position|
      current_board = @board.dup
      current_board[pot_position] = @next_mover_mark
      switched_mark = current_board.next_mark
      next_move << TicTacToeNode.new(current_board,switched_mark,pot_position)
    end

    next_move
  end
end