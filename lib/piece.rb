# frozen_string_literal: true

# Piece class will be inherited by all pieces
class Piece
  attr_accessor :location
  attr_reader :color, :board

  def initialize(board, color, location)
    @board = board
    @color = color
    @location = location
  end

  # Check if a piece on a given position is an enemy.
  def enemy?(location)
    !board.return_piece(location).nil? && board.return_piece(location).color != color
  end

  # Check if a piece on a given position is a friend.
  def friend?(location)
    !board.return_piece(location).nil? && board.return_piece(location).color == color
  end

  # Don't allow piece to go into check. Look at available moves, try them and see if they lead into check.
  # If they don't lead to check, add them to safe moves
  def safe_moves
    moves = []
    available_moves.each do |move|
      # Make a deep copy of board to try out if the move leads to check.
      board_copy = Marshal.load(Marshal.dump(board))
      board_copy.move_piece(location, move)
      moves << move unless board_copy.in_check?(color)
    end

    moves
  end
end
