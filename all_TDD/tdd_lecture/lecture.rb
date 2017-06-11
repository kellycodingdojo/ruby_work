class Dog
	attr_reader :name, :happiness
	def initialize name
		@name = name
		@happiness = 10
	end

	def bark
		"Meow"
	end

	def random_num
		num = rand(0..5)
		puts num
		num
	end

	def run
		@happiness += 5
	end

	def fetch
		"long stick"
	end

	def dogpile
		puts "This is so much fun!"
	end
end