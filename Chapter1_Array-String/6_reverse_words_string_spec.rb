# Given an input string s, reverse the string word by word.
# For example, given s = "the sky is blue", return "blue is sky the".

class WordReverser
  attr_reader :tracker, :word

  def initialize
    @tracker = ""
    @word = ""
  end

  def reverse_words(string)
    string.split(" ").reverse.join(" ")
  end

  def reverse_words_without_using_reverse_or_split(string)
    string.chars.each do |char|
      if char_not_a_space?(char)
        @word += char
      else
        add_word_to_tracker(word)
        @word = ""
      end
    end
    add_final_word(word)
  end

  def add_final_word(word)
    return word if tracker == ""
    word + " " + tracker
  end

  def add_word_to_tracker(word)
    if first_completed_non_blank_word?(word)
      @tracker = word
    elsif additional_completed_non_blank_word?(word)
      @tracker = word + " " + tracker
    end
  end

  def char_not_a_space?(char)
    char != " "
  end

  def first_completed_non_blank_word?(word)
    tracker == "" && word != ""
  end

  def additional_completed_non_blank_word?(word)
    tracker != "" && word != ""
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

  it 'can reverse a string with double word by word without using reverse or split' do
    wr = WordReverser.new

    answer = wr.reverse_words_without_using_reverse_or_split("blue")

    expect(answer).to eq("blue")
  end
end
