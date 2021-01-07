require "./pieces"

class Cell
  attr_accessor :value, :piece

  def initialize(value, piece=nil)
    @value = value
    @piece = piece
  end

end

class Board
  attr_accessor :cells

  def initialize
    @cells = []
    create_board
    set_up
  end

  #creates a 8x8 board with 64 cells
  def create_board

    8.times do |col|
      8.times do |row|
        new_cell = Cell.new([col + 1, row + 1])
        cells.push(new_cell)
      end
    end

  end

  def fill_cell(location, piece)
    cell = find_cell(location)
    cell.piece = piece
  end

  #return cell with given value
  def find_cell(value)
    cells.each { |current_node| return current_node if current_node.value == value}
  end

  def set_up
    @cells.each do |cell|

      if cell.value[1] == 2
        cell.piece = Pawn.new(1)
      end

      if cell.value[1] == 7
        cell.piece = Pawn.new(2)
      end

    end
  end

  def move(start, end)


    
  end

end

#def set_up

Board.new
