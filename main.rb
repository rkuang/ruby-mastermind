require_relative "mastermind"

loop do
    Mastermind.new
    play_again = nil
    loop do
        print "Play again? (y/n): "
        play_again = gets.chomp.downcase
        break if /\A[yn]\Z/i.match?(play_again)
        puts "Invalid response. Type 'y' or 'n'."
    end
    break if play_again == "n"
end
