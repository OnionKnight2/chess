# frozen_string_literal: true

require_relative 'board'
require 'colorize'

# BoardRender class will render a board, representing a chess board with text
class BoardRender
  attr_reader :board

  def initialize(board)
    @board = board
  end

  def render
    8.times do |row|
      8.times do |column|
        piece = board.return_piece([row, column])
        if piece.nil?
          print '  '.colorize(:background => :white) if (row + column) % 2 == 0
          print '  '.colorize(:background => :green) if (row + column) % 2 != 0
        else
          print "#{piece} ".colorize(:color => :black, :background => :white) if (row + column) % 2 == 0
          print "#{piece} ".colorize(:color => :black, :background => :green) if (row + column) % 2 != 0
        end
      end
      puts ''
    end
  end
end
