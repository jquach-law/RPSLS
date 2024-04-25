require_relative "element"
require_relative "history"

class Player
    attr_reader :name, :history
    def initialize(str_name, obj_history)
        @name = str_name
        @history = obj_history
    end

    def play
        fail "This method should be overridden"
    end
end

class StupidBot < Player
    def play
        @history.log_play($moves[0])
        $moves[0]
    end
end

class RandomBot < Player
    def play
        @history.log_play($moves[rand(5)])
        $moves[rand(5)]
    end
end

class IterativeBot < Player
    def play
        next_hsh = {
            "Rock" => 1,
            "Paper" => 2,
            "Scissors" => 3,
            "Lizard" => 4,
            "Spock" => 0
        }
        move = $moves[0]
        if not @history.plays.empty?
            next_num = next_hsh[@history.plays[-1].name]
            move = $moves[next_num]
        end
        @history.log_play(move)
        move
    end
end

class LastPlayBot < Player
    def play
        move = $moves[0]
        if not @history.opponent_plays.empty?
            move = @history.opponent_plays[-1]
        end
        @history.log_play(move)
        move
    end
end

class Human < Player
    def play
        puts "(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock"
        print "Enter your move: "
        num = gets.chomp.to_i
        while not [1,2,3,4,5].include? num
            puts "Invalid move - try again"
            puts "(1) Rock\n(2) Paper\n(3) Scissors\n(4) Lizard\n(5) Spock"
            print "Enter your move: "
            num = gets.chomp.to_i
        end
        @history.log_play($moves[num-1])
        $moves[num-1]
	end
end

