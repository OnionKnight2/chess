# frozen_string_literal: true

require_relative '../piece'
require_relative '../Stepable'

# King class holds the king's color
class King < Piece
  include Stepable

  # King can move 1 step in each direction
  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s
    color == :white ? "\u2654" : "\u265a"
  end
end
