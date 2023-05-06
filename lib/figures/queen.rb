# frozen_string_literal: true

# Queen class holds the queen's color
class Queen
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # Queen can move in all directions
  def move_directions
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s 
    color == :white ? "\u2655" : "\u265b"
  end
end

queen = Queen.new(:white)
queen2 = Queen.new(:black)
puts queen
puts queen2