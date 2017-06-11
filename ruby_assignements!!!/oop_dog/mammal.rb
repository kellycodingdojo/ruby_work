class Mammal
	attr_writer :health
  def initialize
    @health = 150
  end

  def display_health
    puts @health
  end
end