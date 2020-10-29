require "rspec"
require "deck"

describe Deck do
    subject(:deck) {Deck.new}
    describe "Deck#initialize" do
        it "creates standard 52 cards deck" do
            expect(deck.length).to eq(52)
        end

        # it "creates an array with all"

        it "contains no repeating cards" do
            # count = Hash.new(0)
            # deck.cards
            expect(deck.cards).to eq(deck.cards.uniq)
        end
    end

    describe "Deck#draw_card" do
        it "draws a card from the deck" do
            drawn_card = deck.draw_card
            expect(drawn_card).to be_a(Card)
            expect(deck.length).to eq(51)
        end

        it "should not draw from an empty deck" do
            52.times { deck.draw_card }
            expect { deck.draw_card }.to raise_error("Deck is empty")
        end
    end

    describe "Deck#shuffle" do
        it "shuffles all the cards in a deck" do
            original_cards = deck.cards
            deck.shuffle
            expect(original_cards).to_not eq(deck.cards)
        end
    end
end

# initialize a deck of 52 non repeating cards
# draw card(s) from the deck
# put cards back in deck
# shuffle the deck