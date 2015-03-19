gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/scrabs'


class ScrabsTest < Minitest::Test
  
  def test_it_can_score_a_single_letter
    assert_equal 1, Scrabs.new.score("a")
    assert_equal 4, Scrabs.new.score("f")
  end

  def test_it_can_score_2_letters
  	assert_equal 4, Scrabs.new.score("ab")
  	assert_equal 5, Scrabs.new.score("hl")
  end

  def test_it_can_score_5_letters
  	assert_equal 8, Scrabs.new.score("hello")
  	assert_equal 24, Scrabs.new.score("hlzjn")
  end

  def test_it_can_handle_empty_string   
    assert_equal 0, Scrabs.new.score(" ")
  end

  def test_it_can_handle_nil
    assert_equal 0, Scrabs.new.score(nil)
  end

  def test_it_ignores_unknown_input
    assert_equal 7, Scrabs.new.score("abc!")
  end

  def test_it_creates_an_array_of_values_and_multiplies_by_3
    assert_equal 30, Scrabs.new.multiplies("hello", [1,2,2,1,1], 3)
  end

  def test_it_keeps_track_of_score_of_all_words_played
    scrabble = Scrabs.new
    assert_equal 0, scrabble.total
    scrabble.play('hello')
    assert_equal 8, scrabble.total
    scrabble.play('hi')
    assert_equal 13, scrabble.total
  end

  def test_it_gives_highest_scoring_word
    scrabble = Scrabs.new
    assert_equal "hello", scrabble.high_word("cat", "hello")
    assert_equal "hello", scrabble.high_word("hello", "dog")
    assert_equal "zz", scrabble.high_word("hello", "zz")     
  end

  def test_it_wins_when_score_reaches_100
    scrabble = Scrabs.new
    assert_equal true, scrabble.win?("zzzzzzzzzz")
  end

  def test_it_spits_the_winning_word_with_the_fewest_characters
    scrabble = Scrabs.new
    assert_equal "zeebra", scrabble.winning_word(["hello", "word", "nads", "zeebra"])
  end

end


