# frozen_string_literal: true

require_relative '../piece'

# Pawn class holds the pawn's color
class Pawn < Piece
  # If a pawn is black, it should go downward, and if it's white, it should go upward.
  # (-1 means up and 1 means down)
  def direction
    color == :white ? -1 : 1
  end

  def starting_position?
    return location[0] == 6 if color == :white
    return location[0] == 1 if color == :black
  end

  # Pawn can move 2 steps forward in the beginning or 1 step forward in general.
  # Also, when it can move diagonally one step when it eats opponent's piece.
  def available_moves
    moves = []
    current_row, current_column = location
    one_forward = [current_row + direction, current_column]

    unless !board.in_bounds?(one_forward) || friend?(one_forward) || enemy?(one_forward)
      moves << one_forward
    end

    two_forward = [current_row + 2 * direction, current_column]
    unless !board.in_bounds?(two_forward) || friend?(two_forward) || enemy?(two_forward) || !starting_position?
      moves << two_forward
    end

    diag_left = [current_row + direction, current_column - 1]
    diag_right = [current_row + direction, current_column + 1]
    moves << diag_left if enemy?(diag_left)
    moves << diag_right if enemy?(diag_right)

    moves
  end

  def to_s
    color == :white ? "\u2659" : "\u265f"
  end
end
