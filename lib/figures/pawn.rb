# frozen_string_literal: true

require_relative '../piece'

# Pawn class holds the pawn's color
class Pawn < Piece
  # Pawn can move 2 steps forward in the beginning or 1 step forward in general.
  # Also, when it can move diagonally one step when it eats opponent's piece.
  def move_directions
    [[1, 0], [-1, 0]]
  end

  def to_s
    color == :white ? "\u2659" : "\u265f"
  end
end
