require_relative "code"

class Mastermind
    MAX_ATTEMPTS = 12

    def initialize()
        @secret_code = Code.new()
        @attempts = 0
        puts "Enter 4 digits between 0 and 5, inclusive."
        while @attempts < Mastermind::MAX_ATTEMPTS do
            print "Attempt ##{@attempts+1}:\t"
            begin
                guess = Code.new(gets.chomp)
            rescue FormatError => exception
                puts "Invalid guess. Try again."
                next
            end
            match, num_right, num_wrong = @secret_code.analyze_with(guess)

            puts "#{num_right} correct digits in correct position"
            puts "#{num_wrong} correct digits in wrong position"
            break if match
            @attempts += 1
        end
        puts match ? "You cracked the code!" : "You lose!"
    end
end
