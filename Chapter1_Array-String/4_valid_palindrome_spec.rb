# Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
# For example,
# "A man, a plan, a canal: Panama" is a palindrome. "race a car" is not a palindrome.

class ValidPalindrome
  def valid_palindrome?(string)
    chars = string.downcase.chomp.chars
    i = 0
    j = chars.size - 1
    while (i < j)
      while (i < j) && (!("a".."z").to_a.include?(chars[i]) && !(1..9).to_a.include?(chars[i]))
        i += 1
      end
      while (i < j) && (!("a".."z").to_a.include?(chars[j]) && !(1..9).to_a.include?(chars[j]))
        j -= 1
      end
      return false if chars[i] != chars[j]
      i +=1
      j -= 1
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
