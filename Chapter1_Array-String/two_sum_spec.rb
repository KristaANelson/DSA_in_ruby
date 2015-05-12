#Given an array of integers, find two numbers such that they add up to a specific target number.
# The function twoSum should return indices of the two numbers such that they add up to the target,
# where index1 must be less than index2. Please note that your returned answers (both index1 and index2)
# are not zero-based.

# You may assume that each input would have exactly one solution.

require 'rspec'

class TwoSum
  def find_indices(numbers, target)
    hash = {}
    numbers.each_with_index do |n, i|
      return "index1=#{hash[n] + 1}, index2=#{i + 1}" if hash[n]
      hash[target - n] = i
    end
  end
end

RSpec.describe TwoSum do
  it 'can find two numbers such that they add up to the target' do
    numbers = [1, 2, 4]
    target = 3
    ts = TwoSum.new

    answer = ts.find_indices(numbers, target)

    expect(answer).to eq("index1=1, index2=2")
  end

  it 'can find two numbers such that they add up to the target' do
    numbers = [1, 2, 5, 9, -7, 20, 3]
    target = 13
    ts = TwoSum.new

    answer = ts.find_indices(numbers, target)

    expect(answer).to eq("index1=5, index2=6")
  end
end
