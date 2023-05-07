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

    pawn = Pawn.new(board, :white, [6, 2])
    pawn2 = Pawn.new(board, :black, [5, 1])
    pawn3 = Pawn.new(board, :black, [1, 1])
    bishop = Bishop.new(board, :black, [0, 2])
    # p pawn.available_moves

    board.place_piece(pawn)
    board.place_piece(pawn2)
    board.place_piece(pawn3)
    board.place_piece(bishop)
    render = BoardRender.new(board)
    render.render

    p pawn.available_moves
    p pawn2.available_moves
    p pawn3.available_moves
    p bishop.available_moves
  end
end
