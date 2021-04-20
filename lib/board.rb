require "./pieces"

class String

  def colorize(color_code)
    "\e[#{color_code}m#{self}\e[0m"
  end

  def green
    colorize(32)
  end

end


class Cell
  attr_accessor :value, :piece, :symbol

  def initialize(value, piece=nil, symbol=" ")
    @value = value
    @piece = piece
    @symbol = symbol
  end

end

class Board
  attr_accessor :cells

  def initialize
    @@cells = []
    create_board
    set_up
  end

  def self.cells
    @@cells
  end

  #creates a 8x8 board with 64 cells
  def create_board

    8.times do |row|
      8.times do |col|
        new_cell = Cell.new([col + 1, row + 1])
        @@cells.push(new_cell)
      end
    end

  end

  def fill_cell(location, piece)
    cell = find_cell(location)
    cell.piece = piece
  end

  #return cell with given value
  def self.find_cell(value)
    @@cells.each do |current_node|
      return current_node if current_node.value == value
    end
  end

  def set_up
    @@cells.each do |cell|

      if cell.value[1] == 2
        cell.piece = Pawn.new(1)
        cell.symbol = "\u265F"
      end

      if cell.value[1] == 7
        cell.piece = Pawn.new(2)
        cell.symbol = "\u2659"
      end

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

  def initialize(start, final, player)
    #@start_cell = Board.find_cell(start.split(""))
    @final_cell = final.split("")
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

  @@players = []

  def initialize
    @interface = Interface.new
    puts "board and players have been set up"
    game_cycle
  end

  def game_cycle

    @game_won = false
    current_player = 1

    while @game_won == false do
      player = @@players[current_player - 1]
      @interface.make_move(player)

      current_player = current_player == 1 ? 2 : 1
    end


  end

  def self.players(array)
    @@players = array
  end


end

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
    Manager.players([player1, player2])
    board = Board.new
  end

  def make_move(player)
    puts "#{player.name}'s turn."

    display_board()

    #Check if valid
    puts "Start location:"
    start = gets.chomp
    puts "End location:"
    final = gets.chomp

    move = Move.new(start, final, player)
  end

  def display_board()
    cell_array = Board.cells

    8.times do |row|
      puts "   " + "-" * 41
      print "#{(8 - row).to_s.green}  |"
      8.times do |col|

        cell = 0

        cell_array.each do |current|
          if current.value == [col + 1, 8 - row]
            cell = current
          end
        end

        print " #{cell.symbol}  |"

      end
      puts ""
    end
    puts "   " + "-" * 41
    print "    "
    ("A".."H").to_a.each do |letter|
      print "  #{letter.green}  "
    end

    puts ""

  end

end

game = Manager.new
