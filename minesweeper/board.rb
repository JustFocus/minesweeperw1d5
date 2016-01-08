require_relative 'tile.rb'

class Board

  attr_reader :grid

  def initialize(size = 9)
    @size = size
    @grid = Array.new(size){Array.new(size){Tile.new}}
    bomb_count = (2..(size*size / 2)).to_a.sample
    seed_bombs(bomb_count)
  end


  def seed_bombs(bomb_count)

    while bomb_count > 0
      x_cord = (0..(@size - 1)).to_a.sample # 0
      y_cord = (0..(@size - 1)).to_a.sample # 0

      if @grid[y_cord][x_cord].value.nil?
        @grid[y_cord][x_cord].value = :X
        bomb_count -= 1
      end

    end
  end


end
