

class Element
    attr_accessor :name
    def initialize(str_name)
        @name = str_name
    end

    def compare_to
        fail "This method should be overridden"
    end

    def compare_helper(hsh, shape_class, shape_name)
        # Win
        if hsh.include?(shape_class.name)
            ["#{shape_name} #{hsh[shape_class.name]} #{shape_class.name}", "Win"]
        # Tie
        elsif shape_name == shape_class.name
            ["#{shape_name} equals #{shape_class.name}", "Tie"]
        # Lose
        else 
            [shape_class.compare_to(self)[0], "Lose"]
        end
    end

end

# ROCK
class Rock < Element
    def compare_to(shape_class)
        hsh = Hash["Lizard" => "crushes", "Scissors" => "crushes"]
        compare_helper(hsh, shape_class, @name)
    end
end

# PAPER
class Paper < Element
    def compare_to(shape_class)
        hsh = Hash["Rock" => "covers", "Spock" => "disproves"]
        compare_helper(hsh, shape_class, @name)
    end
end

# Lizard
class Lizard < Element
    def compare_to(shape_class)
        hsh = Hash["Paper" => "eats", "Spock" => "poisons"]
        compare_helper(hsh, shape_class, @name)
    end
end

# Scissors
class Scissors < Element
    def compare_to(shape_class)
        hsh = Hash["Paper" => "cut", "Lizard" => "decapitate"]
        compare_helper(hsh, shape_class, @name)
    end
end

# Spock
class Spock < Element
    def compare_to(shape_class)
        hsh = Hash["Scissors" => "smashes", "Rock" => "vaporizes"]
        compare_helper(hsh, shape_class, @name)
    end
end


rock = Rock.new("Rock")
spock = Spock.new("Spock")
paper = Paper.new("Paper")
lizard = Lizard.new("Lizard")
scissors = Scissors.new("Scissors")

$moves = [rock, paper, scissors, lizard, spock]


