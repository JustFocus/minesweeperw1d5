require_relative 'player.rb'
require_relative 'board.rb'

class Game

  def initialize
    @board = Board.new
    @player = Player.new
  end

  def choose_tile
    current_guess = @player.prompt
    y_guess, x_guess = current_guess
    @board.grid[y_guess][x_guess].value
  end



  def play

    chosen_tile_value = choose_tile #=> 3, 2, 1, 0, :X

    until won?(chosen_tile_value)

      @board.reveal(x,y) #FIX THIS << PARAM


      chosen_tile_value = choose_tile #=> 3, 2, 1, 0
    end

  end

  def won?(choose_tile)
    if choose_tile == :X
      "game over"
    elsif #all non-bombs are revealed
      "you win"
    else
      true
  end


end
