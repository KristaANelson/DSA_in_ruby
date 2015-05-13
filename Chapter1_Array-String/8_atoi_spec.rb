# Implement atoi to convert a string to an integer.

# The atoi function first discards as many whitespace characters as necessary
# until the first non-whitespace character is found. Then, starting from this
# character, takes an optional initial plus or minus sign followed by as many
# numerical digits as possible, and interprets them as a numerical value.

# The string can contain additional characters after those that form the integral
# number, which are ignored and have no effect on the behavior of this function.

# If the first sequence of non-whitespace characters in str is not a valid integral
# number, or if no such sequence exists because either str is empty or it contains
# only whitespace characters, no conversion is performed.

# If no valid conversion could be performed, a zero value is returned. If the correct
# value is out of the range of representable values, the maximum integer value
# (2147483647) or the minimum integer value (–2147483648) is returned.

class AtoiSimulator
  attr_reader :sign, :possible_starters, :first_real_char, :digits, :string_to_int_hash

  def initialize()
    @first_real_char = nil
    @digits = []
    @string_to_int_hash =   {
                              "1" => 1,
                              "2" => 2,
                              "3" => 3,
                              "4" => 4,
                              "5" => 5,
                              "6" => 6,
                              "7" => 7,
                              "8" => 8,
                              "9" => 9,
                              "0" => 0
                            }
    @possible_starters = string_to_int_hash.keys + ["+", "-"]
  end

  def convert_to_number(string)
    string.length.times do |i|
      if valid_starting_char?(string[i])
        if !possible_starters.include?(string[i])
          return 0
        elsif ["+", "-"].include?(string[i])
          @sign = string[i]
        else ("0".."9").to_a.include?(string[i])
          @sign = "+" if sign == nil
          digits << string_to_int_hash[string[i]]
        end
      end
      if (!possible_starters.include?(string[i]) && first_real_char != nil) || i == string.length - 1
        result = 0
        mult = 1
        digits.reverse.each do |d|
          result += d * mult
          mult = mult * 10
        end
        return 0 - result if sign == "-"
        return result
      end
    end
  end

  def valid_starting_char?(char)
    possible_starters.include?(char) && first_real_char == nil
  end
end

require 'rspec'

RSpec.describe AtoiSimulator do
  it 'can convert a string to an integer' do
    as = AtoiSimulator.new

    answer = as.convert_to_number("1")

    expect(answer).to eq(1)
  end

  it 'can convert a string to a negative integer' do
    as = AtoiSimulator.new

    answer = as.convert_to_number("-1")

    expect(answer).to eq(-1)
  end

  it 'can convert a string to an integer with spaces in front' do
    as = AtoiSimulator.new

    answer = as.convert_to_number(" 1")

    expect(answer).to eq(1)
  end

  it 'can convert a string to a negative integer with spaces in front' do
    as = AtoiSimulator.new

    answer = as.convert_to_number(" -1")

    expect(answer).to eq(-1)
  end

  it 'can convert a string to a negative integer with spaces at the end' do
    as = AtoiSimulator.new

    answer = as.convert_to_number(" -1   ")

    expect(answer).to eq(-1)
  end

  it 'can convert a string to a negative integer with spaces and chars at the end' do
    as = AtoiSimulator.new

    answer = as.convert_to_number(" -1  a ")

    expect(answer).to eq(-1)
  end
end
