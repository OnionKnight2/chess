# frozen_string_literal: true

require_relative '../piece'
require_relative '../Slideable'

# Rook class holds the rook's color
class Rook < Piece
  include Slideable

  # Rook can move horizontally or vertically. (up, down, right, left)
  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  def to_s
    color == :white ? "\u2656" : "\u265c"
  end
end
