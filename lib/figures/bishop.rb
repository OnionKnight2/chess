# frozen_string_literal: true

require_relative '../piece'
require_relative '../Slideable'

# Bishop class holds the bishop's color
class Bishop < Piece
  include Slideable

  # Bishop can move diagonally
  def move_directions
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s
    color == :white ? "\u2657" : "\u265d"
  end
end
