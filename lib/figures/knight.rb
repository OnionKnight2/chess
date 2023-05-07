# frozen_string_literal: true

require_relative '../piece'
require_relative '../Stepable'

# Knight class holds the knight's color
class Knight < Piece
  include Stepable

  # Knight moves in a "L" direction
  def move_directions
    [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

  def to_s
    color == :white ? "\u2658" : "\u265e"
  end
end
