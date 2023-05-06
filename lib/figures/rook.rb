# frozen_string_literal: true

# Rook class holds the rook's color
class Rook
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # Rook can move horizontally or vertically. (up, down, right, left)
  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  def to_s
    color == :white ? "\u2656" : "\u265c"
  end
end

rook = Rook.new(:white)
rook2 = Rook.new(:black)

puts rook
puts rook2