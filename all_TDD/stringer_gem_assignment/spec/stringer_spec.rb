require "spec_helper"
RSpec.describe Stringer do
  it "concatenates undefined number of strings with a space" do 
    expect(Stringer.spacify "Oscar", "Vazquez", "Zweig", "Olasaba", "Hernandez", "Ricardo", "Mendoza").to eq("Oscar Vazquez Zweig Olasaba Hernandez Ricardo Mendoza")
  end
end

# RSpec.describe Stringer do
#   it "has a version number" do
#     expect(Stringer::VERSION).not_to be nil
#   end

#   it "does something useful" do
#     expect(false).to eq(true)
#   end
# end
