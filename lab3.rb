require_relative "element"   # uncomment to load element.rb
require_relative "player"    # uncomment to load player.rb 
require_relative "history"   # uncomment to load history.rb

######################################### 	
#     CS 381 - Programming Lab #3		#
#										#
#  < Justin Quach-Law >					#
#  < quachlaj@oregonstate.edu >	        #
#										#
#########################################


$bot_hsh = {
	1 => [StupidBot, "StupidBot"],
	2 => [RandomBot, "RandomBot"],
	3 => [IterativeBot, "IterativeBot"],
	4 => [LastPlayBot, "LastPlayBot"],
	5 => [Human, "Human"]
}

puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!

Please choose two players:
(1) #{$bot_hsh[1][1]}
(2) #{$bot_hsh[2][1]}
(3) #{$bot_hsh[3][1]}
(4) #{$bot_hsh[4][1]}
(5) #{$bot_hsh[5][1]}
"

def select_player
	print "Select player 1: "
	num1 = gets.chomp.to_i
	print "Select player 2: "
	num2 = gets.chomp.to_i
	until [1,2,3,4,5].include?(num1) and [1,2,3,4,5].include?(num2)
		puts "Invalid choice(s) - start over"
		print "Select player 1: "
		num1 = gets.chomp.to_i
		print "Select player 2: "
		num2 = gets.chomp.to_i
	end
	$p1 = $bot_hsh[num1][0].new($bot_hsh[num1][1], History.new)
	$p2 = $bot_hsh[num2][0].new($bot_hsh[num2][1], History.new)
	puts "#{$p1.name} vs. #{$p2.name}"
end

def game(rounds)
	for i in 1..rounds
		puts "\nRound #{i}:"
		p1move = $p1.play
		p2move = $p2.play
		$p1.history.log_opponent_play(p2move)
		$p2.history.log_opponent_play(p1move)
		puts "Player 1 chose #{p1move.name}"
		puts "Player 2 chose #{p2move.name}"

		compare = p1move.compare_to(p2move)
		puts compare[0]
		if compare[1] == "Win"
			puts "Player 1 won the round"
			$p1.history.add_score
		elsif compare[1] == "Lose"
			puts "Player 2 won the round"
			$p2.history.add_score
		else
			puts "Round was a tie"
		end

		if i == rounds
			p1score = $p1.history.score
			p2score = $p2.history.score
			puts "\nFinal score is #{p1score} to #{p2score}"
			puts "Game was a draw" if p1score == p2score
			puts "Player 2 wins" if p1score < p2score
			puts "Player 1 wins" if p1score > p2score
			puts "\n"
		end
	end
end


def main
	select_player
	# Main Program (should be last)
	n_rounds = 5
	# call to kick off the game
	game(n_rounds)
end

main