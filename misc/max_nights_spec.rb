class MaxNightFinder
  attr_reader :total_nights

  def initialize
    @total_nights = 0
  end
  
  def find_max_nights(array)
    largest_val, largest_index = array.each_with_index.max

    day_before_index = largest_index - 1 if largest_index > 0
    day_before_val = day_before_index ? array[day_before_index] : 0

    day_after_index  = largest_index + 1 if largest_index < (array.size - 1)
    day_after_val = day_after_index ? array[day_after_index] : 0

    if largest_val >= day_before_val + day_after_val
      @total_nights += largest_val
      i = day_before_index || 0
      j = day_after_index || array.size - 1
    else largest_val <  day_before_val + day_after_val
      @total_nights += day_before_val + day_after_val
      i = (day_before_index || 0) - 1
      i = 0 if i < 0
      j = (day_after_index || array.size - 1 ) + 1
      j = array.size - 1 if j > array.size - 1
    end
    array -= array[i..j]
    if array.empty?
      return total_nights
    else
      find_max_nights(array)
    end
  end
end

require 'rspec'

RSpec.describe MaxNightFinder do
  it 'can find max nights' do
    mnf = MaxNightFinder.new
    ans =mnf.find_max_nights([1, 2, 3])
    expect(ans).to eq(4)
  end

  it 'can find max nights 4' do
    mnf = MaxNightFinder.new
    ans =mnf.find_max_nights([1, 3, 5, 3])
    expect(ans).to eq(6)
  end

  it 'can find max nights outside' do
    mnf = MaxNightFinder.new
    ans =mnf.find_max_nights([5, 2, 3, 6])
    expect(ans).to eq(11)
  end

  it 'can find max nights tie' do
    mnf = MaxNightFinder.new
    ans =mnf.find_max_nights([1, 2, 4, 2])
    expect(ans).to eq(5)
  end
end
