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
          print '  '
        else
          print "#{piece} "
        end
      end
      puts ''
    end
    puts '----------------'
  end
end

board = Board.new
renderer = BoardRender.new(board)
rook_white_one = Rook.new(board, :white, [7, 7])
rook_white_two = Rook.new(board, :white, [7, 6])
king_black = King.new(board, :black, [0, 7])
board.place_piece(rook_white_one)
board.place_piece(rook_white_two)
board.place_piece(king_black)
renderer.render

p board.checkmate?(:black)
