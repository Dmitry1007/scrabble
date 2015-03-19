require 'pry'

class Scrabbles

  def format_word(word)
    word.to_s.upcase.chars
  end
  
  def score(word)
    formatted_word = format_word(word)

    formatted_word.reduce(0) do |sum, l| 
      if point_values.include?(l)
        sum + point_values[l]
      else
        sum + 0
      end  
    end
  end

  def score_with_multipliers(word, multipliers, multiple=1)
    @points = format_word(word).map.with_index do |letter, index|
      point_values[letter] * multipliers[index]
    end.reduce(:+)

    adds_bonus if word.length == 7 
    @points * multiple    
  end

  def adds_bonus
    @points += 10 
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