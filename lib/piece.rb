# frozen_string_literal: true

# Piece class will be inherited by all pieces
class Piece
  attr_reader :color, :board, :location

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
end
