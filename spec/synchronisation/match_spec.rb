# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"

RSpec.describe Match do
  before :each do
    @j1 = Joueur.new "Mauti", "Joris", 19
    @j2 = Joueur.new "Mauti", "Enzo", 20
    @m = Match.new @j1, @j2
  end
  it "can be printed" do
    res = "Match: #{@j1} VS #{@j2}\n"
    res += "Vainqueur #{@m.winner} en #{@m.timer.div(60)} minutes et #{@m.timer % 60} secondes"
    expect(@m.to_s).to eql res
  end

  it "have a winner" do
    expect(@m.winner).to be_kind_of Joueur
  end
end
