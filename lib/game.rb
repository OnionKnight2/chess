# frozen_string_literal: true

require_relative 'board_render'
require_relative 'player'

# Game class contains all neccessary logic for the game of chess to be played
class Game
  attr_reader :player_one, :player_two, :board, :renderer
  attr_accessor :current_player

  def initialize
    @player_one = Player.new(nil, :white)
    @player_two = Player.new(nil, :black)
    @board = Board.start_chess
    @renderer = BoardRender.new(board)
    @current_player = player_one
  end

  def play
    intro

    # Render a board
    renderer.render

    until over?
      # Let player know if he's in check.
      puts 'You are in check!' if board.in_check?(current_player.color)
      take_turn
      # Clear the terminal
      puts `clear`
      renderer.render
      swap_turn
    end
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def take_turn
    # Prompt user for a move until the move is legit. Meaning that starting position is not nil,
    # selected piece's color is correct and there are available moves for this piece.
    piece_start = input_select
    until board.in_bounds?(piece_start) && !board.return_piece(piece_start).nil? && board.return_piece(piece_start).color == current_player.color && !board.return_piece(piece_start).safe_moves.empty?
      puts 'Invalid location'
      piece_start = input_select
    end

    # Selected move needs to be one of the available moves
    piece_end = input_destination
    until board.return_piece(piece_start).safe_moves.include?(piece_end)
      puts "Available moves are: #{board.return_piece(piece_start).safe_moves}"
      piece_end = input_destination
    end

    # Make a move
    board.move_piece(piece_start, piece_end)
  end

  # Change who's move it is
  def swap_turn
    self.current_player = current_player == player_one ? player_two : player_one
  end

  # Get user input for selecting a piece to move
  def input_select
    puts "\n#{current_player}, select a piece to move: "
    gets.chomp.split(',').map(&:to_i)
  end

  # Get user input for a move destination
  def input_destination
    puts "\n#{current_player}, enter the move's destination"
    gets.chomp.split(',').map(&:to_i)
  end

  # Prompt players for their names
  def intro
    puts "Hello and welcome to the game of CHESS!\n\n"
    puts "Users should enter their moves in a row number, column number way\n\n"
    puts 'Player one, please enter your name (You will have white pieces): '
    player_one.name = gets.chomp
    puts 'Player two, please enter your name (You will have black pieces): '
    player_two.name = gets.chomp
    puts
  end
end
