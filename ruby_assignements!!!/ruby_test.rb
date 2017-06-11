# puts "\t\t\t hello world" 

# puts "Ruby! " * 2

# puts "Chunky" << "Bacon"


# puts "Chunky"[2..3]

# puts "ruBy".capitalize

# puts "team".include?("i")

# puts "ruBy".upcase

# <---------------------------------------------

# def guess_num param
# 	num = 25 
# 	if param == num
# 		return " you guessed it"
# 	elsif param < num
# 		return "num is too low"
# 	else param > num
# 		return "num is too high"		
# 	end
# end

# puts guess_num 25
# puts guess_num 100
# puts guess_num 0

# <---------------------------------------------

# puts "hello" if 0  
# puts "hello" if ""
# puts "hello" if nil     answer

# <---------------------------------------------

# puts "goodbye" if false
# puts "goodbye" if nil
# puts "goodbye" if []   answer

# <---------------------------------------------

# puts "ruby" unless 0
# puts "ruby" unless ""
# puts "ruby" unless nil   answer

# <---------------------------------------------

 # puts "matz" unless false
 # puts "matz" unless nil
 # puts "matz" unless []    answer


 # <------------------------------------------testing area
 
numbers_array = [3,5,1,2,7,9,8,13,25,32]

# Return the sum of all numbers in the array.
# puts numbers_array.reduce(:+)

# puts numbers_array.reject { |i| i < 10 }

# puts letters_array = ("a".."z").to_a

# 3.times {puts numbers_array}

str = ""
5.times { str << rand(65..90).chr }
puts str