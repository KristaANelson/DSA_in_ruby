# O(n) runtime, O(1) space – In-place reverse:
# Let us indicate the ith word by wi and its reversal as wi′. Notice that when you reverse a
# word twice, you get back the original word. That is, (wi′)′ = wi.
# The input string is w1 w2 ... wn. If we reverse the entire string, it becomes wn′ ... w2′ w1′.
# Finally, we reverse each individual word and it becomes wn ... w2 w1. Similarly, the same result
# could be reached by reversing each individual word first, and then reverse the entire string.

# Challenge 1:
# Implement the two-pass solution without using the library’s split function.
# Challenge 2:
# Rotate an array to the right by k steps in-place without allocating extra space.
# For instance, with k = 3, the array [0, 1, 2, 3, 4, 5, 6] is rotated to [4, 5, 6, 0, 1, 2, 3].

class WordReverserTwo
  def reverse_words(string)
    string = string.reverse
    i, j = ""
    string.size.times do |index|
      if string[index] != " " && i == ""
        i, j = index
      elsif string[index] != " " && i != ""
        j = index
      else
        string[i..j] = string[i..j].reverse
        i, j = ""
      end
    end
    string[i..j] = string[i..j].reverse
    string
  end

  def reverse_another_way(string)
    string = string.reverse
    i = 0
    (string.length + 1).times do |j|
      if j == (string.length) || string[j] == " "
        string[i..j-1] = string[i..j-1].reverse
        i = j + 1
      end
    end
    string
  end

  def rotate_array(array, k)
    r = array.pop(k)
    array.unshift(r).flatten
  end

  def rotate_another_way(array, k)
    r = array[-k..-1]
    remainder = array - r
    r + remainder
  end
end

require 'rspec'

RSpec.describe WordReverserTwo do
  it 'can reverse words in place' do
    wrt = WordReverserTwo.new

    answer = wrt.reverse_words("the sky is blue")

    expect(answer).to eq("blue is sky the")
  end

  it 'can reverse words in place another way' do
    wrt = WordReverserTwo.new

    answer = wrt.reverse_another_way("the sky is blue")

    expect(answer).to eq("blue is sky the")
  end

  it 'can rotate an array to the right by k steps' do
    wrt = WordReverserTwo.new

    answer = wrt.rotate_array([1, 2, 3, 4], 2)

    expect(answer).to eq([3, 4, 1, 2])
  end

  it 'can rotate an array to the right by k steps another way' do
    wrt = WordReverserTwo.new

    answer = wrt.rotate_another_way([1, 2, 3, 4], 2)

    expect(answer).to eq([3, 4, 1, 2])
  end
end
