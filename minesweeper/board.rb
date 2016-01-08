require_relative 'tile.rb'

class Board

    MOVES = [
      [0,1],
      [0,-1],
      [1,0],
      [1,1],
      [1,-1],
      [-1,0],
      [-1,1],
      [-1,-1]
    ]

  attr_reader :grid

  def initialize(size = 9)
    @size = size
    @grid = Array.new(size){Array.new(size){Tile.new}}
    bomb_count = (2..(size*size / 2)).to_a.sample
    seed_bombs(bomb_count)
    set_neutral_tiles
  end


  def seed_bombs(bomb_count)

    while bomb_count > 0
      x_cord = (0..(@size - 1)).to_a.sample # 0
      y_cord = (0..(@size - 1)).to_a.sample # 0

      if @grid[y_cord][x_cord].value != :X
        @grid[y_cord][x_cord].value = :X
        bomb_count -= 1
      end

    end
  end

  def set_neutral_tiles
      @grid.each_with_index do |row, x_coord|
        row.each_with_index do |tile, y_coord|
          if @grid[y_coord][x_coord].value == :X
            increment_tile_value(y_coord, x_coord)
          end
        end
      end
  end

  def increment_tile_value(y_coord, x_coord)
    current_tile = @grid[y_coord][x_coord]
    MOVES.each do |x_adder, y_adder|
      current_tile = @grid[y_coord + x_adder][x_coord + y_adder] if valid_move?(y_coord+x_adder, x_coord + y_adder)

      if (!current_tile.nil? && current_tile.value != :X )
          if valid_move?(y_coord+x_adder, x_coord + y_adder)
          current_tile.value += 1
          end
      end
    end


  end

    def valid_move?(x,y)
      return false if x < 0 || x >= @size
      return false if y < 0 || y >= @size
      true
    end



  # def bfs(target = nil, &prc)
  #   raise "Need a proc or target" if [target, prc].none?
  #   prc ||= Proc.new { |node| node.value == target }
  #
  #   nodes = [self]
  #   until nodes.empty?
  #     node = nodes.shift
  #
  #     return node if prc.call(node)
  #     nodes.concat(node.children)
  #   end
  #
  #   nil
  # end

end
