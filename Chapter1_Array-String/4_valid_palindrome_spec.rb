# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
# For example,
# "A man, a plan, a canal: Panama" is a palindrome. "race a car" is not a palindrome.

class ValidPalindrome
  attr_reader :letter_or_num, :i

  def initialize
    @letter_or_num = ("a".."z").to_a + (0..9).to_a
  end

  def valid_palindrome?(string)
    chars = string.downcase.chomp.chars
    i = 0 ; j = chars.size - 1
    while (i < j)
      i += 1 while (i < j) && (!letter_or_num.include?(chars[i]))
      j -= 1 while (i < j) && (!letter_or_num.include?(chars[j]))
      return false if chars[i] != chars[j]
      i +=1 ; j -= 1
    end
    return true
  end
end

require 'rspec'

RSpec.describe ValidPalindrome do
  it 'can determine if a given string a palindrome' do
    vp = ValidPalindrome.new
    answer = vp.valid_palindrome?("A man, a plan, a canal: Panama")
    expect(answer).to eq(true)
  end

  it 'can refutes if a given string is not a palindrome' do
    vp = ValidPalindrome.new
    answer = vp.valid_palindrome?("")
    expect(answer).to eq(true)
  end
end
