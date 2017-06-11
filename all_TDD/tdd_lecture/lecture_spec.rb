require_relative 'lecture'
RSpec.describe Dog do 

	before (:each) do
		@dog = Dog.new("Clifford")
	end

	it 'has a method random which returns a random number between 0 and 5' do
		expect(@dog.random_num).to be_between(0,5)
	end
	it 'has a getter for name attribute' do
		expect(@dog.name).to eq("Clifford")
	end

	it 'raises an error when you try to set the name direct' do
		expect{@dog.name = "New"}.to raise_error(NoMethodError)
	end

	it 'has a method called bark which returns a sound' do
		expect(@dog.bark).to eq("Meow")
	end

	it 'has a method called run which increases happiness' do
		current_happiness = @dog.happiness
		@dog.run
		expect(@dog.happiness).to eq(current_happiness + 5)
	end

	it 'has a method called fetch which returns a random stick' do
		expect(@dog.fetch).to eq("long stick")
	end

	it 'has a method called dogpile which prints out "This is so much fun!"' do
		expect{@dog.dogpile}.to output("This is so much fun!\n").to_stdout
	end

end