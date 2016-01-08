class Board

  attr_reader :grid

  def initialize(size =  9)
    @size = size
    @grid = Array.new(size){Array.new(size)}
    bomb_count = (2..(size*size / 2)).to_a.sample
    seed_bombs(bomb_count)
  end


  def seed_bombs(bomb_count)

    while bomb_count > 0
      x_cord = (0..(@size - 1)).to_a.sample # 0
      y_cord = (0..(@size - 1)).to_a.sample # 0

      if @grid[y_cord][x_cord].nil?
        @grid[y_cord][x_cord] = :X
        bomb_count -= 1
      end

    end
  end


end
