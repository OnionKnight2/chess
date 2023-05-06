# frozen_string_literal: true

# Knight class holds the knight's color
class Knight
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # Knight moves in a "L" direction
  def move_directions
    [[1, 2], [1, -2], [-1, 2], [-1, -2], [2, 1], [2, -1], [-2, 1], [-2, -1]]
  end

  def to_s 
    color == :white ? "\u2658" : "\u265e"
  end
end

knight = Knight.new(:white)
knight2 = Knight.new(:black)
puts knight
puts knight2