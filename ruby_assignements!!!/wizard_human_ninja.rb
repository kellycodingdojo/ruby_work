class Human
  attr_accessor :strength, :intelligence, :stealth, :health
  def initialize
    @strength = 3
    @intelligence = 3
    @stealth = 3
    @health = 100
  end

  def attack(obj)
    if obj.class.ancestors.include?(Human)
      obj.health -= 10
      true
    else
      false
    end

  def levelUp()
      puts "You have leveled up"
      self.health += 10
      self.intelligence += 1
      self.stealth += 1
      self.strength += 1
    end

  def display_health
    puts @health
    puts @intelligence
    puts @stealth
    puts @strength
  end

  end
end

folock = Human.new
froto = Human.new
puts folock.attack(froto)
puts folock.attack("Not a Human")
puts froto.health

puts folock.levelUp
  folock.display_health
