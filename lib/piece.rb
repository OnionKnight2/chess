# frozen_string_literal: true

# Piece class will be inherited by all pieces
class Piece
  attr_reader :color, :board

  def initialize(board, color)
    @board = board
    @color = color
  end

  # Check if a piece on a given position is an enemy.
  def enemy?(location)
    row, column = location
    !board.return_piece(location).nil? && board.return_piece(location).color != color
  end
end