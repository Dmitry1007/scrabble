gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/scrabbles'

class ScrabblesTest < Minitest::Test

def test_it_can_score_a_single_letter
    assert_equal 1, Scrabbles.new.score("a")
    assert_equal 4, Scrabbles.new.score("f")
  end

  def test_it_can_score_2_letters
  	assert_equal 4, Scrabbles.new.score("ab")
  	assert_equal 5, Scrabbles.new.score("hl")
  end

  def test_it_can_score_5_letters
  	assert_equal 8, Scrabbles.new.score("hello")
  	assert_equal 24, Scrabbles.new.score("hlzjn")
  end

  def test_it_can_handle_empty_string   
    assert_equal 0, Scrabbles.new.score(" ")
  end

  def test_it_can_handle_nil
    assert_equal 0, Scrabbles.new.score(nil)
  end

  def test_it_ignores_unknown_input
    assert_equal 7, Scrabbles.new.score("abc!")
  end

  def test_it_multiplies_word_by_array
    assert_equal 9, Scrabbles.new.score_with_multipliers("hello", [1,2,1,1,1])
  end

  def test_it_multiplies_word_by_array
    assert_equal 18, Scrabbles.new.score_with_multipliers("hello", [1,2,1,1,1], 2)
    assert_equal 33, Scrabbles.new.score_with_multipliers("sparkle", [1,2,1,1,1,4,5])
  end

end