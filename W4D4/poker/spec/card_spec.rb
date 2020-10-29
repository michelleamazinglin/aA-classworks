require "card"
require "rspec"

describe Card do
    subject(:card) { Card.new("DIAMOND", "A") }

    describe "Card#initialize" do
        it "sets a suit" do
            expect(card.suit).to eq("DIAMOND")
        end

        it "sets a value" do
            expect(card.value).to eq("A")
        end

        it "can not recieve a invalid suit" do
            expect{Card.new("blablabla","A")}.to raise_error("Invalid suit")
        end

        it "can not recieve a invalid value" do
            expect{Card.new("DIAMOND","AAAAAAA")}.to raise_error("Invalid value")
        end

    end

    describe "Card#to_s" do
        it "returns a short string representation of a card" do
            expect(card.to_s).to eq("DA")
        end
    end

end