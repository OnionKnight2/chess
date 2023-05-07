# frozen_string_literal: true

require_relative 'board_render'

class Game
  def initialize

  end

  def play
    # starting_board = Board.start_chess
    # render = BoardRender.new(starting_board)
    board = Board.new
    

    # rook = starting_board.return_piece([7, 0])
    # p rook.available_moves

    pawn = Pawn.new(board, :white, [5, 0])
    pawn2 = Pawn.new(board, :white, [5, 1])
    rook = Rook.new(board, :black, [6, 0])
    queen = Queen.new(board, :white, [3, 4])
    # p pawn.available_moves

    board.place_piece(pawn)
    board.place_piece(rook)
    board.place_piece(queen)
    board.place_piece(pawn2)
    render = BoardRender.new(board)
    render.render

    p pawn.available_moves
    p pawn2.available_moves
    p rook.available_moves
  end
end
