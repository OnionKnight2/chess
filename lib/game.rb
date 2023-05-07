# frozen_string_literal: true

require_relative 'board_render'

class Game
  def initialize
    
  end

  def play
    starting_board = Board.start_chess
    render = BoardRender.new(starting_board)
    render.render

    rook = starting_board.return_piece([7, 0])
    p rook.available_moves
  end
end