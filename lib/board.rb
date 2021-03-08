require "./pieces"

class Interface

  def initialize
    start_message
  end

  def start_message
    puts "Welcome to terminal chess!"
    puts "The game of pure skill with only one sure winner!"
    create_players()
  end

  def create_players
    puts "Name of player 1: "
    num1 = gets.chomp
    player1 = Player.new(num1, 1)
    puts "Name of player 2: "
    num2 = gets.chomp
    player2 = Player.new(num2, 2)
    board = Board.new
  end

  def make_move(player)
    
  end

end

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

  def move(player, start, final)

    start_cell = find_cell(start)

    if start_cell.piece.player == player

    else
      #"Move not valid try again" move_message()
    end

  end


end

class Player
  attr_accessor :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end

end

class Move

  def initialize(start, final, piece, player)
    @start_cell = start
    @final_cell = final
    @piece = piece
    @player = player
  end

  def check_final
    #check if final cell is optional
    #if same player return move not possible
    #else kill(end cell piece)

    #move_piece()
  end

  def move_piece()

  end

  def end_turn
    #change player and send back or call visuals
  end

end

class Manager

  def initialize
    @interface = Interface.new
    puts "board and players have been set up"
    game_cycle
  end

  def game_cycle
    puts "hi"
    @game_won = false
    current_player = [1, 2].cycle

    while @game_won == false do
      puts "#{current_player}"
      @interface.make_move(current_player)

      current_player = current_player.next
    end


  end


end

game = Manager.new
