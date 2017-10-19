
def display_board(boardCase)
  puts " #{boardCase[0]} | #{boardCase[1]} | #{boardCase[2]} "
  puts "-----------"
  puts " #{boardCase[3]} | #{boardCase[4]} | #{boardCase[5]} "
  puts "-----------"
  puts " #{boardCase[6]} | #{boardCase[7]} | #{boardCase[8]} "
end

boardCase = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

display_board(boardCase)




 
WIN_COMBINATIONS = [
	[0,1,2]
	[3,4,5]
	[6,7,8]
	[0,3,6]
	[1,4,7]
	[2,5,8]
	[0,4,8]
	[2,4,6]
]






class Player
	#Nom + Etat (If 3 symbole = victory)
	attr_accessor :nom, :valeur
	attr_writer #il a gagné ? 
	
	def initialize(nom, valeur)
		#Doit régler Nom, Valeur, Etat de victoire
		@nom = nom 
		@valeur = O || X
		puts "Creating #{self.name}"
	end
end






puts "Quel est ton pseudo ?"
player = player.new(gets.strip)
puts "Hello " + player + ". Bienvenue dans ce jeu Tic Tac Toe !"





class Board
	include Enumerable
	attr_accessor :BoardCase[]

	def initialize
		#Quand la classe s'initialise, elle doit créer 9 instances BoardCases
		#Ces instances sont rangées dans une array qui est à l'attr_accesor de la classe

		def display_board(boardCase)
			puts "#{boardCase[0]} | #{boardCase[1]} | #{boardCase[3]}"
			puts "----------"
			puts "#{boardCase[3]} | #{boardCase[4]} | #{boardCase[5]}"
			puts "----------"
			puts "#{boardCase[6]} | #{boardCase[7]} | #{boardCase[8]}"
		end

		boardCase = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
		display_board(boardCase)
		board = board.new 

	end
end




  def new_game?
    puts "Would you like to start a new game? (y/n)"
    start = gets.chomp
    if "y" == start
      Game.new
    elsif "n" == start
      exit
    else
      new_game?


  puts "0  #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
	  puts "  ---+---+---"
	  puts "1  #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
	  puts "  ---+---+---"
	  puts "2  #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "


	  	puts "   1   2   3 "
	  puts "A  #{@board[:A1]} | #{@board[:A2]} | #{@board[:A3]} "
	  puts "  ---+---+---"
	  puts "B  #{@board[:B1]} | #{@board[:B2]} | #{@board[:B2]} "
	  puts "  ---+---+---"
	  puts "C  #{@board[:C1]} | #{@board[:C2]} | #{@board[:C3]} "


 def victory?
    @victory_ways = [
      [@board[0][0], [@board[0][1], [@board[0][2]],
      [@board[1][0], [@board[1][1], [@board[1][2]],
      [@board[2][0], [@board[2][1], [@board[2][2]],
      [@board[0][0], [@board[1][0], [@board[2][0]],
      [@board[0][1], [@board[1][1], [@board[2][1]],
      [@board[0][2], [@board[1][2], [@board[2][2]],
      [@board[0][0], [@board[1][1], [@board[2][2]],
      [@board[2][0], [@board[1][1], [@board[0][2]],
    ]
  
    @victory_ways.each do |win|
     return true if @board[win[0]]==@board[win[1]] && @board[win[0]]==@board[win[2]] && (@board[win[0]]=='X' || @board[win[0]]=='O') return true if @board
        end
      return false
    end

    def tie
      return true if @turn==9
    end