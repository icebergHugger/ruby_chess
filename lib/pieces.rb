
class Pawn
  attr_accessor :player

  def initialize(player)
    @player = player
    @first_move = true
    puts "creted pawn"
  end

  def legal_move?(first, last)
    #player 1: +     player 2: -

    # is first move

    #can move y+/-1 && x+1 if node.filled.player != @player
  end

end
