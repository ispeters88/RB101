
def example_3
  [[1, 2], [3, 4]].map do |arr|
    puts arr.first
    arr.first
  end
end

=begin

Line    Action        Object        Side Effect       Return Value                  Return Value Used?
1       method (map)  outer array   none              new array                     no, but shown at end
1-4     block ex      sub-arrays                      first value in sub array      used by map method
2       method (puts) 1st element   output str        nil                           no
                      of subarr     representation
                                    of int
3       method(first) subarray      none              first value of subarr         yes, returned by block to #map


return value is 1D array, [1, 3]

=end

# p example_3

def example_4
  my_arr = [[18, 7], [3, 12]].each do |arr|
    arr.each do |num|
      if num > 5
        puts num
      end
    end
  end
end

=begin

Line    Action            Object            Side Effect             Return Value                    Return Value Used?
1       method(=)         arr object        none                    object pointed to by my_arr     No
                          pointed to by
                          my_arr variable
1       method(each)      array pointed to  none                    array pointed to by my_arr      Yes, used by var assignment
                          by my_arr                        
1-6     block ex          each sub arr      none                    sub arr                         No
2       method(each)      each sub array    none                    sub array                       Yes, val for outer block
2-5     block ex          each value in
                          the sub array     none                    nil                             no
3       conditional                                                 result of if                    No
4       method(puts)      number in sub     output text to          nil                             No
                          array             console                   

output

18
7
12
[[18, 7], [6, 12]]        <= original array

=end

# p example_4

def example_5
  [[1, 2], [3, 4]].map do |arr|
    arr.map do |num|
      num * 2
    end
  end
end

=begin

Line  Action            Object                        Side Effect     Return Value               Return Value Used?
1     method(map)       [[1, 2],[3, 4]]               none            array, with transform      shown at end
                                                                      values
1-5   outer block ex    subarray                      none            subarray with each number
                                                                      doubled
2     method (map)      subarray                      none            subarray, with transform   yes, by outer map method call
2-4   inner block ex    val in subarray               none            value * 2                  yes, by inner map method call
3     method (*)        num                           none            num * 2                    yes, by inner block

[[2, 4], [6, 8]]

=end

p example_5


def example_6
  [{ a: 'ant', b: 'elephant' }, { c: 'cat' }].select do |hash|
    hash.all? do |key, value|
      value[0] == key.to_s
    end
  end
end