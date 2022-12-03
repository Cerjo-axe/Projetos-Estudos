require_relative "../board.rb"

describe Board do
    describe "#board"do
        subject {Board.new}
        describe "#iscomplete?" do
            it "board is full" do
                subject.instance_variable_set(:@houses,["X","O","X","X","O","X","O","X","O"])
                expect(subject.iscomplete?).to be false
            end
            it "board is not full" do
                subject.instance_variable_set(:@houses,["X","O",3,"X","O","X",7,"X",9])
                expect(subject.iscomplete?).to be true
            end
        end

        describe "#iswinner?"do
            it "player 1 wins vertically" do
                subject.instance_variable_set(:@houses,["X","O","X","X","O","X","X",8,9])
                expect(subject.iscomplete?).to be true
            end

            it "player 1 wins horizontally" do
                subject.instance_variable_set(:@houses,["X","X","X",4,"O",6,7,8,"O"])
                expect(subject.iscomplete?).to be true
            end

            it "player 1 wins diagonally" do
                subject.instance_variable_set(:@houses,["X","O",3,4,"X","O",7,8,"X"])
                expect(subject.iscomplete?).to be true
            end

            it "player 2 wins vertically" do
                subject.instance_variable_set(:@houses,["X","O","X","X","O","X",7,"O",9])
                expect(subject.iscomplete?).to be true
            end

            it "player 2 wins horizontally" do
                subject.instance_variable_set(:@houses,["O","O","O",4,"X",6,7,8,"X"])
                expect(subject.iscomplete?).to be true
            end

            it "player 2 wins diagonally" do
                subject.instance_variable_set(:@houses,["O","X",3,4,"O","X",7,8,"O"])
                expect(subject.iscomplete?).to be true
            end
        end
    end
end