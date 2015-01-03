require_relative 'scorer'

describe Scorer do
  let(:my_scorer) {Scorer.new}
  let(:zero_game) {['-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-','-']}
  let(:ninety_game) {['9','-','9','-','9','-','9','-','9','-','9','-','9','-','9','-','9','-','9','-']}
  let(:one_fifty_game) {['5','/','5','/','5','/','5','/','5','/','5','/','5','/','5','/','5','/','5','/','5']}
  let(:perfect_game) {['X','X','X','X','X','X','X','X','X','X','X','X']}

  describe "#score" do
    it "scores a game with no pins as 0" do
      expect(my_scorer.score(zero_game)).to eq(0)
    end

    it "scores a game with 9 and 0 pins everytime as 90" do
      expect(my_scorer.score(ninety_game)).to eq(90)
    end

    it "scores a game with 5 and spare everytime as 150" do
      expect(my_scorer.score(one_fifty_game)).to eq(150)
    end
    it "scores a perfect game 300" do
      expect(my_scorer.score(perfect_game)).to eq(300)
    end
  end

end
