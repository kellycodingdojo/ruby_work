# def test 
#   yield 5 
#   puts "You are in the method test" 
#   yield 100 
# end 
# test { |i| puts "You are in the block #{i}" }

# <-------------------------print 1-225
# for i in 0..255
# 	puts "#{i}"
# end

# <--------------------------Print odds 1-255
# for i in 0..255
# 	if i % 2 != 0
# 	puts "#{i}"
# end
# end

# <--------------------------Print sum

# sum = 0
# (0..255).each { |i| puts "New Number: #{i} Sum: #{sum += i}"}

# <--------------------------iterate though array

array = [1,3,5,7,9,13]
# for i in array
# 	puts "#{i}"
# end

# <--------------------------find max in array

# puts array.max

# <--------------------------find avg in array
# sum = 0
# array.each {|i| puts "the sum of the array is: #{sum += i}"}
# 	puts sum/array.length  
#<-----to get decimals here you would need to type these as floats instead of interagers. 

# <-------------------------array of odd numbers

# for i in 0..255
# 	y=[]
# 	if i % 2 != 0
# 	puts y.push("#{i}")
# end
# end

# <-------------------------array of odd numbers
x = [1, 3, 5, 7, 9, 17]
# y = 3
# puts x.count { |elem| elem > y }


# <-------------------------square array values
# puts x.map! { |i| i * i }

# <-------------------------remove neg nums
arr = [1, 5, 10, -2]
# puts arr.each_index { |index| arr[index] = 0 if arr[index] < 0 }


# <-------------------------min max and avg
arr = [1, 5, 10, -2]
# { max: arr.max, min: arr.min, average: arr.reduce(:+) / arr.length.to_f }  
#<--.to_f gives a decimal.

# <-------------------------shifting val in array
arr = [1, 5, 10, 7, -2]
arr.rotate!(1)[arr.length-1] = 0
puts arr

# <-------------------------num to string
arr = [-1, -3, 2]
# puts arr.each_index { |index| arr[index] = "Dojo" if arr[index] < 0 }