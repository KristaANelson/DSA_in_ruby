# Implement strStr().
#
# Returns the index of the first occurrence of needle in haystack,
# or -1 if needle is not part of haystack.

class StrStr
  def find_first_index(string, substring)
    string = string.downcase.chomp.chars
    substring = substring.downcase.chomp.chars
    l = substring.size
    string.each_with_index do |char, j|
      if char == substring[0]
        return j + 1 if string[j...j+l] == substring
      end
    end
    return "#{substring.join} not found"
  end
end

require 'rspec'

RSpec.describe StrStr do
  it 'returns the index of the first occurrence of needle in haystack' do
    ss = StrStr.new
    answer = ss.find_first_index("mississippi", "iss")
    expect(answer).to eq(2)
  end

  it 'returns the index of the first occurrence of needle in haystack' do
    ss = StrStr.new
    answer = ss.find_first_index("mississippi", "issippi")
    expect(answer).to eq(5)
  end

  it 'returns the index of the first occurrence of needle in haystack' do
    ss = StrStr.new
    answer = ss.find_first_index("mississippi", "issikppi")
    expect(answer).to eq("issikppi not found")
  end
end
