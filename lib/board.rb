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
      pawn_white = Pawn.new(board, :white, [6, i])
      pawn_black = Pawn.new(board, :black, [1, i])
      board.place_piece(pawn_white)
      board.place_piece(pawn_black)
    end

    # White and black rooks
    rook_white_one = Rook.new(board, :white, [7, 0])
    rook_white_two = Rook.new(board, :white, [7, 7])
    rook_black_one = Rook.new(board, :black, [0, 0])
    rook_black_two = Rook.new(board, :black, [0, 7])
    board.place_piece(rook_white_one)
    board.place_piece(rook_white_two)
    board.place_piece(rook_black_one)
    board.place_piece(rook_black_two)

    # White and black knights
    knight_white_one = Knight.new(board, :white, [7, 1])
    knight_white_two = Knight.new(board, :white, [7, 6])
    knight_black_one = Knight.new(board, :black, [0, 1])
    knight_black_two = Knight.new(board, :black, [0, 6])
    board.place_piece(knight_white_one)
    board.place_piece(knight_white_two)
    board.place_piece(knight_black_one)
    board.place_piece(knight_black_two)

    # White and black bishops
    bishop_white_one = Bishop.new(board, :white, [7, 2])
    bishop_white_two = Bishop.new(board, :white, [7, 5])
    bishop_black_one = Bishop.new(board, :black, [0, 2])
    bishop_black_two = Bishop.new(board, :black, [0, 5])
    board.place_piece(bishop_white_one)
    board.place_piece(bishop_white_two)
    board.place_piece(bishop_black_one)
    board.place_piece(bishop_black_two)

    # White and black queen
    queen_white = Queen.new(board, :white, [7, 3])
    queen_black = Queen.new(board, :black, [0, 3])
    board.place_piece(queen_white)
    board.place_piece(queen_black)

    # White and black king
    king_white = King.new(board, :white, [7, 4])
    king_black = King.new(board, :black, [0, 4])
    board.place_piece(king_white)
    board.place_piece(king_black)

    board
  end

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  # #place_piece method puts a piece on a grid
  def place_piece(piece)
    row = piece.location[0]
    column = piece.location[1]
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