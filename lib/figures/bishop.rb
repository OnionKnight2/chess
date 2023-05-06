# frozen_string_literal: true

# Bishop class holds the bishop's color
class Bishop
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # Bishop can move diagonally
  def move_directions
    [[1, 1], [1, -1], [-1, 1], [-1, -1]]
  end

  def to_s 
    color == :white ? "\u2657" : "\u265d"
  end
end

bishop = Bishop.new(:white)
bishop2 = Bishop.new(:black)
puts bishop
puts bishop2