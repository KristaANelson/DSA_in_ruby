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
end

require 'rspec'

RSpec.describe WordReverserTwo do
  it 'can reverse words in place' do
    wrt = WordReverserTwo.new
    answer = wrt.reverse_words("the sky is blue")
    expect(answer).to eq("blue is sky the")
  end
end
