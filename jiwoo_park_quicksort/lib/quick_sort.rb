class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)

  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    # p start, length, array
    prc ||= proc {|a,b| a <=> b }

    return if length < 2
    pivot_idx = QuickSort.partition(array, start, length,&prc)


    sort2!(array, start, pivot_idx - start,&prc)
    sort2!(array, pivot_idx + 1, length-1-pivot_idx,&prc)

    array


  end

  def self.partition(array, start, length, &prc)

    prc ||= proc {|a,b| a<=>b }
    pivot = array[start]
    marker = start


    ((start+1)...(start+length)).each do |idx|
        #print(array,' ',idx, ' ',start, ' ', "HERE")
        # next if idx == start
      if prc.call(pivot,array[idx]) == 1
        marker += 1
        array[marker], array[idx] = array[idx],array[marker]
      end

    end


    array[marker], array[start] = array[start], array[marker]

    return marker


  end
end




# def self.partition(array, start, length, &prc)
#
#   prc ||= proc {|a,b| a<=>b }
#
#   marker = start
#
#
#   ((start+1)...(array.length)).each do |idx|
#       #print(array,' ',idx, ' ',start, ' ', "HERE")
#       # next if idx == start
#     if array[idx] <= array[start] && (idx - marker) == 1
#       marker += 1
#     elsif  array[idx] <= array[start] && (idx - marker) != 1
#       marker += 1
#       array[marker], array[idx] = array[idx],array[marker]
#     end
#
#   end
#
#
#   array[marker], array[start] = array[start], array[marker]
#
#   return marker
#
#
# end
