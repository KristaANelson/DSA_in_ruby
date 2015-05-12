# Given an input string s, reverse the string word by word.
# For example, given s = "the sky is blue", return "blue is sky the".

class WordReverser
  def reverse_words(string)
    string.split(" ").reverse.join(" ")
  end

  def reverse_words_without_using_reverse_or_split(string)
    word = ""
    tracker = ""
    string.chars.each do |char|
      if char != " "
        word += char
      else
        if tracker == "" && word != ""
          tracker = word
        elsif tracker != "" && word != ""
          tracker = word + " " + tracker
        end
        word = ""
      end
    end
    word + " " + tracker if word != ""
  end
end

require 'rspec'

RSpec.describe WordReverser do
  it 'can reverse a string word by word' do
    wr = WordReverser.new

    answer = wr.reverse_words("the sky is blue")

    expect(answer).to eq("blue is sky the")
  end

  it 'can reverse a string with double word by word' do
    wr = WordReverser.new

    answer = wr.reverse_words("the  sky is blue")

    expect(answer).to eq("blue is sky the")
  end

  it 'can reverse a string word by word without using reverse or split' do
    wr = WordReverser.new

    answer = wr.reverse_words_without_using_reverse_or_split("the sky is blue")

    expect(answer).to eq("blue is sky the")
  end

  it 'can reverse a string with double word by word without using reverse or split' do
    wr = WordReverser.new

    answer = wr.reverse_words_without_using_reverse_or_split("the sky is  blue")

    expect(answer).to eq("blue is sky the")
  end
end
