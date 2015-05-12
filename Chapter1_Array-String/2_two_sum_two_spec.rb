# Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.

class TwoSumTwo
  # approach 1 O(n)runtime O(n)space
  # skip calc if number is already larger then target
  # check to see if it's match has already been recorded in the hash and if so return solution
  # otherwise record number in hash and what it's match is
  def find_indices(numbers, target)
    hash = {}
    numbers.each_with_index do |n, i|
      unless n >= target
        return "index1=#{hash[n] + 1}, index2=#{i + 1}" if hash[n]
        hash[target - n] = i
      end
    end
  end

  # O(n log n) runtime O(1)space
  def twoSum(numbers, target)
    numbers.each_with_index do |n, index|
      i = index
      (numbers.length - 1).times do
        j = bsearch(numbers, target - n,  i + 1)
        return "index1=#{index + 1}, index2=#{j + 1 }" if (j != -1)
        i += 1
      end
    end
  end

  def bsearch(array, key, start)
    left = start
    right = array.length - 1
      while (left < right)
      med = (left + right) / 2
      if (array[med] < key)
        left = med + 1;
      else
        right = med
      end
    end
    return (left == right && array[left] == key) ? left : -1
  end

  #O(n) runtime, O(1) space
  def two_pointers(numbers, target)
    i = 0
    j = numbers.length - 1
    until i == j
      if numbers[i] + numbers[j] < target
        j -= 1
      elsif numbers[i] + numbers[j] > target
        i += 1
      else
        return "index1=#{i + 1}, index2=#{j + 1 }"
      end
    end
  end
end

require 'rspec'

RSpec.describe TwoSumTwo do
  it 'can find two numbers that sum a target given a sorted array of numbers using og approach' do
    numbers = [7, 4, 3, 2, 1]
    target = 6
    tst = TwoSumTwo.new

    answer = tst.find_indices(numbers, target)

    expect(answer).to eq("index1=2, index2=4")
  end

  it 'can find two numbers that sum a target given a sorted array of numbers' do
    numbers = [7, 4, 3, 2, 1]
    target = 6
    tst = TwoSumTwo.new

    answer = tst.twoSum(numbers, target)

    expect(answer).to eq("index1=2, index2=4")
  end

  it 'can find two numbers that sum a target given a sorted array of numbers using two pointers' do
    numbers = [7, 4, 3, 2, 1]
    target = 6
    tst = TwoSumTwo.new

    answer = tst.two_pointers(numbers, target)

    expect(answer).to eq("index1=2, index2=4")
  end
end
