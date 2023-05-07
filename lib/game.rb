# frozen_string_literal: true

require_relative 'board_render'

class Game
  def initialize

  end

  def play
    starting_board = Board.start_chess
    render = BoardRender.new(starting_board)
    render.render

    pawn = Pawn.new(starting_board, :white, [2, 5])
    rook = Rook.new(starting_board, :white, [3, 3])
    knight = Knight.new(starting_board, :black, [2, 1])
    starting_board.place_piece(pawn)
    starting_board.place_piece(rook)
    starting_board.place_piece(knight)
    render.render
  end
end
