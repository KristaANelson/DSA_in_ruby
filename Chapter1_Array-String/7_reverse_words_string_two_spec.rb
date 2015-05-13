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
end
