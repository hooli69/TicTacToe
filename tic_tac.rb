class Board
	include Enumerable
	attr_accessor :board

	def initialize
	#Quand la classe s'initialise, elle doit créer 9 instances BoardCases
	#Ces instances sont rangées dans une array qui est à l'attr_accesor de la classe
	@board = Array.new(3) { Array.new(3," ") }
	end

	def add_valeur(position, valeur)
		#Définir des positions pour les valeurs X,O
		@board[position[0]][position[1]] = valeur
	end

		def to_s
	#Afficher le plateau
			puts "  0   1   2"
			puts "0 #{board[0][0]} | #{board[0][1]} | #{board[0][2]}"
			puts "-------------"
			puts "1 #{board[1][0]} | #{board[1][1]} | #{board[1][2]}"
			puts "-------------"
			puts "2 #{board[2][0]} | #{board[2][1]} | #{board[2][2]}"
		end

	def victory
		if 
			((@board[0][0] == "X") && (@board[0][1] == "X") && (@board[0][2] == "X")) ||
     		((@board[1][0] == "X") && (@board[1][1] == "X") && (@board[1][2] == "X")) ||
    		((@board[2][0] == "X") && (@board[2][1] == "X") && (@board[2][2] == "X")) ||
    		((@board[0][0] == "X") && (@board[1][0] == "X") && (@board[2][0] == "X")) ||
    		((@board[0][1] == "X") && (@board[1][1] == "X") && (@board[2][1] == "X")) ||
    		((@board[0][2] == "X") && (@board[1][2] == "X") && (@board[2][2] == "X")) ||
    		((@board[0][0] == "X") && (@board[1][1] == "X") && (@board[2][2] == "X")) ||
    		((@board[2][0] == "X") && (@board[1][1] == "X") && (@board[0][2] == "X"))
    		puts "Player_1 a gagné !"
    		to_s
    		return true
    	elsif 
    		((@board[0][0] == "O") && (@board[0][1] == "O") && (@board[0][2] == "O")) ||
     		((@board[1][0] == "O") && (@board[1][1] == "O") && (@board[1][2] == "O")) ||
    		((@board[2][0] == "O") && (@board[2][1] == "O") && (@board[2][2] == "O")) ||
    		((@board[0][0] == "O") && (@board[1][0] == "O") && (@board[2][0] == "O")) ||
    		((@board[0][1] == "O") && (@board[1][1] == "O") && (@board[2][1] == "O")) ||
    		((@board[0][2] == "O") && (@board[1][2] == "O") && (@board[2][2] == "O")) ||
    		((@board[0][0] == "O") && (@board[1][1] == "O") && (@board[2][2] == "O")) ||
    		((@board[2][0] == "O") && (@board[1][1] == "O") && (@board[0][2] == "O"))
    		puts "Player_2 a gagné !"
    		to_s
    		return true
    	elsif 
    		((@board[0][0] == ("X" || "O")) &&
     		(@board[0][1] == ("X" || "O")) && 
    		(@board[0][2] == ("X" || "O")) &&
    		(@board[1][1] == ("X" || "O")) &&
    		(@board[1][2] == ("X" || "O")) &&
    		(@board[2][0] == ("X" || "O")) &&
    		(@board[2][1] == ("X" || "O")) &&
    		(@board[2][2] == ("X" || "O")))
		# fonctionne pas, no time
    		puts "Tie game"
    		
    		return true
    	end
    end
end

class Player
	#Nom + Etat (If 3 symbole = victory)
	attr_accessor :nom, :valeur, :board
	attr_writer #il a gagné ? 
	
	def initialize(nom = "Player", valeur, board)
		#Doit régler Nom, Valeur, Etat de victoire
		@nom = nom 
		@valeur = valeur
		@board = board
	end

	def who_s_turn?
		puts "C'est au tour de #{nom} de jouer :"
		puts "-------------------------------------------------"
	end

	def ask_position
		#demander au joueur de jouer
		puts "#{nom} joue avec les '#{valeur}',\nEcris des coodonnées sous le format suivant : 1,2 ou 2,1"
		puts "-------------------------------------------------"
		gets.strip.split(",").map(&:to_i)
	end

	def get_position
		position = ask_position
		@board.add_valeur(position, @valeur)
	end
	
	def check_position(position)
		if position.length == 2 && (position[0] <= 2 && position[0] >=0) && (position[1] <= 2 && position[1] >= 0)
			return true
		else
			return false
		end
	end
end


class Game #gère la partie
	#Initialize 2 instances player
	#Initialize 1 instance de Board (qui intialize les 9 autres instances BoardCase)
	#If victory = end 
	#Demande aux joueurs où ils veuelent jouer
	attr_accessor :game
	def initialize
	#Créé 2 joueurs, cée un board
		@game = Board.new
		@player_1 = Player.new("Player_1", "X", @game)
		@player_2 = Player.new("Player_2", "O", @game)
		@current_player = @player_1
		go()
	end

	def go #lance la partie
		puts "Bienvenue dans ce jeu : Tic Tac Toe "
		puts "-------------------------------------------------"
		puts "Player_1 va jouer avec les X"
		puts "Player_2 va jouer avec les O"
		puts "-------------------------------------------------"
		turn()
	end

	def turn 
		#Afficher plateau
		#Demande au joueur ce qu'il souhaite jouer, 
		#vérifie si un jour a gagne
		#Passe au joueur suivant si la partie n'est pas fini
		until @game.victory == true
		@current_player.who_s_turn?
		@game.to_s
		@current_player.get_position

			if @current_player == @player_1
				@current_player = @player_2
			else
				@current_player = @player_1
			end
		end
		puts @game.to_s
		puts "Jeu fini !"
	end
end

a = Game.new
