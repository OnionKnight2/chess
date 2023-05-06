# frozen_string_literal: true

# Board class will hold a 8x8 grid of nil and pieces
class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8, nil) }
  end

  # #place_piece method puts a piece on a specified field
  def place_piece(piece, location)
    row, column = location
    grid[row][column] = piece
  end

  # #return_piece method returns a piece from a specified location
  def return_piece(location)
    row, column = location
    grid[row][column]
  end

  # #in_bounds? method checks if location in a grid is valid. Remember, our grid has 8 arrays of 8 elements.
  def in_bounds?(location)
    row, column = location
    row < grid.length && row >= 0 && column < grid.first.length && column >= 0
  end
end

board = Board.new
board.place_piece('K', [5, 2])
p board