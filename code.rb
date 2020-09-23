class Code
    LENGTH = 4
    MAX_DIGIT = 5
    attr_reader :code

    def initialize(string = nil)
        if string
            raise FormatError unless /\A[0-5]{4}\Z/.match?(string)
            @code = string
        else
            @code = (Array.new(Code::LENGTH){rand(Code.MAX_DIGIT+1)}).join()
        end
    end

    def analyze_with(other)
        num_right_in_right_position = 0
        num_right_in_wrong_position = 0
        code_copy = String.new(@code)
        Code::LENGTH.times do |i|
            next unless code_copy[i] == other.code[i]
            num_right_in_right_position += 1
            code_copy[i] = 'x' 
        end
        Code::LENGTH.times do |i|
            index = code_copy.index(other.code[i])
            next unless index
            num_right_in_wrong_position += 1
            code_copy[index] = 'x'
        end
        return @code == other.code, num_right_in_right_position, num_right_in_wrong_position
    end
end

class FormatError < Exception; end
