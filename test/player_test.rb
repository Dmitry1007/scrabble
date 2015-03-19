gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/player'

class PlayerTest < Minitest::Test

	def test_when_it_plays_it_computes_the_total
		player = Player.new
		assert_equal 0, player.total
		player.play('hello')
		assert_equal 8, player.total
		player.play('hi')
		assert_equal 13, player.total
	end

	def test_it_wins_when_total_is_26
		player = Player.new
		player.play('hello')
		refute player.won?
		player.play('hi')
		refute player.won?
		player.play('snacker')
		assert_equal true, player.won?
	end

	def test_it_can_no_longer_play_once_it_wins
		player = Player.new
		assert_equal "End", player.play("zzz")
	end

	def test_it_returns_unique_letters
		player = Player.new
		assert_equal "sa", player.unique("sass")
		assert_equal "clas", player.unique("class")
	end

	def test_it_returns_number_of_times_unique_letters_appear
		player = Player.new
		hashy_face = {"s"=>3, "a"=>1}
		assert_equal hashy_face, player.unique_times("sass")
	end

end










