class History < ActiveRecord::Base
	belongs_to :lenders
	belongs_to :borrowers
end
