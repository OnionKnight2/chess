# frozen_string_literal: true

# Pawn class holds the pawn's color
class Pawn
  attr_reader :color

  def initialize(color)
    @color = color
  end

  # Pawn can move 2 steps forward in the beginning or 1 step forward in general.
  # Also, when it can move diagonally one step when it eats opponent's piece.
  def move_directions

  end

  def to_s 
    color == :white ? "\u2659" : "\u265f"
  end
end