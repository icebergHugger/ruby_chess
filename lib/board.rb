
class Cell
  attr_accessor :value, :piece

  def initialize(value, piece=nil)
    @value = value
    @piece = piece
  end

end

def create_board

  8.times do |col|
    8.times do |row|
      new_cell = Cell.new([col + 1, row + 1])
    end
  end

end

#def Find_cells


#def fill_cell



#def set_up
