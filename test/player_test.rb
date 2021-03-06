require 'minitest/autorun'
require 'minitest/pride'
require './lib/player'
require './lib/deck'
require './lib/card'

class PlayerTest < MiniTest::Test
  def test_it_exists
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new("Jenny", deck)

    assert_instance_of Player, player
  end

  def test_has_lost
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14)
    cards = [card1, card2, card3]
    deck = Deck.new(cards)
    player = Player.new("Jenny", deck)

    assert_equal false, player.has_lost?
    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    refute player.has_lost?

    player.deck.remove_card
    assert player.has_lost?
  end
end
