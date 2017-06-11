require "stringer/version"
module Stringer
    def self.spacify *strings
        string = ""
        strings.each do |s|
            string += " " + s
        end
        string
    end
end