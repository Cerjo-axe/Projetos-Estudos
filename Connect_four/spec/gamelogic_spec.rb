require_relative "../game.rb"

describe Game do
    subject {Game.new}
    describe "#change_player" do
        it "change player 1 to 2" do
            subject.instance_variable_set(:@player,1)
            subject.change_player
            expect(subject.player).to eq 2
        end

        it "change player 2 to 1" do
            subject.instance_variable_set(:@player,2)
            subject.change_player
            expect(subject.player).to eq 1
        end
    end
end