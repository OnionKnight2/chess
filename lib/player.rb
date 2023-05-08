# frozen_string_literal: true

# Player class will hold player's name and color of his pieces
class Player
  attr_accessor :name, :color

  def initialize(name, color)
    @name = name
    @color = color
  end

  def to_s
    name
  end
end