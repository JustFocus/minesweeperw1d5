class Player

  def initialize
  end

  def prompt
    puts "Enter an X,Y coordinate"
    guess = gets.chomp.split(',').map(&:to_i)
    
  end

end
