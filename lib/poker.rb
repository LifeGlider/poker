load 'poker/version.rb'
load 'card.rb'
load 'game.rb'

module Poker
  class Error < StandardError; end
  FACES = %i[two three four five six seven eight nine ten jack queen king ace].freeze
  SUITS = %i[spades clubs hearts diamonds].freeze

  deck = FACES.flat_map.with_index { |f, v| SUITS.map { |s| Card.new(v + 2, f, s) } }

  hand = deck.sample(2)
  deck -= hand

  table = deck.sample(5)

  puts 'HAND:'
  puts '-'
  puts hand
  puts '-'
  puts 'TABLE:'
  puts '-'
  puts table
  puts '-'

  new_game = Game.new(hand, table)

  puts 'WINNER!'
  puts '-'
  puts new_game.win_combo_name
  puts '-'
  puts new_game.win_cards
end
