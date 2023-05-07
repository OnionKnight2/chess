# frozen_string_literal: true

require_relative '../piece'

# Queen class holds the queen's color
class Queen < Piece
  # Queen can move in all directions
  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s 
    color == :white ? "\u2655" : "\u265b"
  end
end