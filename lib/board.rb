# frozen_string_literal: true

require_relative './figures/pawn'
require_relative './figures/knight'
require_relative './figures/king'
require_relative './figures/bishop'
require_relative './figures/queen'
require_relative './figures/rook'

# Board class will hold a 8x8 grid of nil and pieces
class Board
  attr_reader :grid

  # Set up starting positions for all the pieces
  def self.start_chess
    board = self.new

    # White and black pawns
    8.times do |i|
      pawn_white = Pawn.new(:white)
      pawn_black = Pawn.new(:black)
      board.place_piece(pawn_white, [6, i])
      board.place_piece(pawn_black, [1, i])
    end

    # White and black rooks
    rook_white_one = Rook.new(:white)
    rook_white_two = Rook.new(:white)
    rook_black_one = Rook.new(:black)
    rook_black_two = Rook.new(:black)
    board.place_piece(rook_white_one, [7, 0])
    board.place_piece(rook_white_two, [7, 7])
    board.place_piece(rook_black_one, [0, 0])
    board.place_piece(rook_black_two, [0, 7])

    # White and black knights
    knight_white_one = Knight.new(:white)
    knight_white_two = Knight.new(:white)
    knight_black_one = Knight.new(:black)
    knight_black_two = Knight.new(:black)
    board.place_piece(knight_white_one, [7, 1])
    board.place_piece(knight_white_two, [7, 6])
    board.place_piece(knight_black_one, [0, 1])
    board.place_piece(knight_black_two, [0, 6])

    #White and black bishops
    bishop_white_one = Bishop.new(:white)
    bishop_white_two = Bishop.new(:white)
    bishop_black_one = Bishop.new(:black)
    bishop_black_two = Bishop.new(:black)
    board.place_piece(bishop_white_one, [7, 2])
    board.place_piece(bishop_white_two, [7, 5])
    board.place_piece(bishop_black_one, [0, 2])
    board.place_piece(bishop_black_two, [0, 5])

    # White and black queen
    queen_white = Queen.new(:white)
    queen_black = Queen.new(:black)
    board.place_piece(queen_white, [7, 3])
    board.place_piece(queen_black, [0, 3])

    # White and black king
    king_white = King.new(:white)
    king_black = King.new(:black)
    board.place_piece(king_white, [7, 4])
    board.place_piece(king_black, [0, 4])

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
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