# frozen_string_literal: true

require_relative 'board'

# BoardRender class will render a board, representing a chess board with text
class BoardRender
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      puts '----------------'
      8.times do |column|
        piece = board.return_piece([row, column])
        if piece.nil?
          print "  "
        else
          print "#{piece} "
        end
      end
      puts ''
    end
    puts '----------------'
  end
end

board = Board.start_chess

render = BoardRender.new(board)
render.render