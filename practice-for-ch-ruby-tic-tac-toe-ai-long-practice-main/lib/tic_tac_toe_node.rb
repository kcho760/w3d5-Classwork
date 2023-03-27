require_relative 'tic_tac_toe'

class TicTacToeNode
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos= prev_move_pos
  end

  def children

    pot_positions = @board.open_positions
    pot_positions.each do |pot_position|
      current_board = @board.dup
      current_board.place_mark(pot_position,next_mover_mark)
      switched_mark = current_board.next_mark
      TicTacToeNode.new(current_board,switched_mark,pot_position)
    end
    

  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
  end
end