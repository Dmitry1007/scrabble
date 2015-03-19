require_relative 'scrabs'

class Player

	def initialize
		@total = 0 
	end

	def play(word)
		scrabble = Scrabs.new
		@total += scrabble.score(word)
		
		"End" if won?
	end

	def total
		@total
	end

	def won?
		@total >= 26
	end

	def unique(word)
		word.chars.uniq.join
	end

	def unique_times(word)
		counts = Hash.new(0)
		word.chars.each { |l| counts[l] += 1 }
		counts
	end

end





