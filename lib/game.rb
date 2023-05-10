# frozen_string_literal: true

require_relative 'board_render'
require_relative 'player'
require 'yaml'

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
    # Ask user if he wants to load some of the previous games.
    if ask_to_load
      file_to_load = choose_file
      loaded_game = load_game(file_to_load) if file_to_load
      from_yaml(loaded_game)

      puts `clear`
      @renderer = BoardRender.new(board)
    else
      intro
    end

    # Render a board
    renderer.render

    until over?
      # Let player know if he's in check.
      puts "\n\nYou are in check!" if board.in_check?(current_player.color)
      take_turn if take_turn.nil?
      # Clear the terminal
      puts `clear`
      renderer.render
      swap_turn
    end

    renderer.render
    # Congratulate the winner
    puts "Congratulations, #{return_winner.name}. You Won!!!"
  end

  def over?
    board.checkmate?(current_player.color)
  end

  def return_winner
    board.checkmate?(current_player.color) ? player_one : player_two
  end

  def take_turn
    # Prompt user for a move until the move is legit. Meaning that starting position is not nil,
    # selected piece's color is correct and there are available moves for this piece.
    piece_start = input_select
    until piece_start == 'save' || (board.in_bounds?(piece_start) && !board.return_piece(piece_start).nil? && board.return_piece(piece_start).color == current_player.color && !board.return_piece(piece_start).safe_moves.empty?)
      puts 'Invalid location'
      piece_start = input_select
    end

    # Check if user wants to save a game
    if piece_start == 'save'
      save_game
      puts 'Game saved!'
      return
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

  # Save the game using yaml
  def save_game
    Dir.mkdir('saves') unless Dir.exist?('saves')
    filename = "saves/save_#{current_player.name}.yaml"

    File.open(filename, 'w') do |file|
      file.puts to_yaml
    end
  end

  def ask_to_load
    puts 'Would you like to load one of your saved games? (y/n)'
    do_load = gets.chomp.downcase
    until ['y', 'n'].include?(do_load)
      puts 'Would you like to load one of your saved games? (y/n)'
      do_load = gets.chomp.downcase
    end
    puts ''

    do_load == 'y'
  end

  def load_game(filename)
    unless Dir.empty?('saves')
      File.read("./saves/#{filename.concat('.yaml')}")
    end
  end

  def choose_file
    files = []
    if Dir.exist?('saves') && !Dir.empty?('saves')
      d = Dir.new('saves')
      d.each_child do |file|
        puts "#{File.basename(file, '.yaml')}"
        files << File.basename(file, '.yaml')
      end
      puts ''
      puts 'Enter the file name you want to load: '
      file_to_load = gets.chomp
      until files.include?(file_to_load)
        puts 'Enter the file name you want to load: '
        file_to_load = gets.chomp
      end
      file_to_load
    else
      puts 'There is nothing to load'
    end
  end

  def to_yaml
    YAML.dump(
      {
        player_one: {
          name: player_one.name,
          color: player_one.color,
          turn: current_player == player_one
        },
        player_two: {
          name: player_two.name,
          color: player_two.color,
          turn: current_player == player_two
        },
        board: {
          grid: board.grid
        }
      }
    )
  end

  def from_yaml(loaded_game)
    return unless loaded_game

    data = YAML.unsafe_load(loaded_game)
    @player_one.name = data[:player_one][:name]
    @player_one.color = data[:player_one][:color]
    @player_two.name = data[:player_two][:name]
    @player_two.color = data[:player_two][:color]
    @board.grid = data[:board][:grid]
    @current_player = data[:player_one][:turn] ? player_one : player_two
  end

  # Change who's move it is
  def swap_turn
    self.current_player = current_player == player_one ? player_two : player_one
  end

  # Get user input for selecting a piece to move
  def input_select
    puts "\n#{current_player}, select a piece to move or enter 'save' to save the game: "
    input = gets.chomp
    return 'save' if input == 'save'

    input.split(',').map(&:to_i)
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
