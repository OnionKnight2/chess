# frozen_string_literal: true

# Module used for pieces that move in a step way.
module Stepable
  def available_moves
    moves = []

    move_directions.each do |(x, y)|
      # Add x or y to current location until we hit other friendly pieces or go out of bounds.
      # Also, check if the enemy is on the next location
      current_row, current_column = location

      unless !board.in_bounds?([current_row + x, current_column + y]) || friend?([current_row + x, current_column + y])
        current_row += x
        current_column += y
        moves << [current_row, current_column]
      end
    end

    moves
  end  
end