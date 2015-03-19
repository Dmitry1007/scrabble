class Scrabs

  def initialize
    @total = 0
  end

  def format_word(word)
    word.to_s.upcase.chars
  end
  
  def score(word) 
    format_word(word).reduce(0) do |sum, letter|
      if point_values[letter] 
        sum + point_values[letter]
      else
        sum + 0
      end
    end
  end

  def multiplies(word, letter_mul, word_mul)
    arry = format_word(word).map { |letter| point_values[letter] }
    new_array = arry.map.with_index { |n, index| n * letter_mul[index] }
    new_array.reduce(:+) * word_mul
  end

  def play(word)
    @total += score(word)
  end

  def total
    @total
  end

  def high_word(word, word1)
    [word, word1].max_by { |word| score(word) }
  end

  def win?(word)
    score(word) == 100
  end

  def winning_word(word_array)
    word_hash = word_array.group_by { |word| score(word) }
    highest_score = word_hash.keys.max
    word_hash[highest_score].min_by { |element| element.length }
  end

  def point_values
    {
      "A"=>1, "B"=>3, "C"=>3, "D"=>2,
      "E"=>1, "F"=>4, "G"=>2, "H"=>4,
      "I"=>1, "J"=>8, "K"=>5, "L"=>1,
      "M"=>3, "N"=>1, "O"=>1, "P"=>3,
      "Q"=>10, "R"=>1, "S"=>1, "T"=>1,
      "U"=>1, "V"=>4, "W"=>4, "X"=>8,
      "Y"=>4, "Z"=>10
    }
  end

end





