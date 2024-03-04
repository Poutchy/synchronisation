# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"
require "synchronisation/terrain"
require "synchronisation/arbitre"

def init
  @j1 = Joueur.new "Mauti", "Joris", 19
  @j2 = Joueur.new "Mauti", "Enzo", 20
  a1 = Arbitre.new "Baqui", "Hanma"
  a2 = Arbitre.new "Baquo", "Hanmo"
  a3 = Arbitre.new "Baquu", "Hanmi"
  ab = ArbitreTable.new "Gaston", "Lagaffe"
  @t = Terrain.new [a1, a2, a3], ab
  @m = Match.new @j1, @j2, [@t]
end

RSpec.describe Match do
  before :each do
    init
  end
  it "can be printed" do
    @m.terrain = @t
    res = "\nMatch: #{@j1} VS #{@j2}\n"
    res += "Terrain: #{@t.in_match}\n"
    expect(@m.to_s).to eql res
  end

  it "can be printed with winner" do
    @m.winner
    @m.terrain = @t
    res = "\nMatch terminé\n"
    res += "Match: #{@j1} VS #{@j2}\n"
    res += "Terrain: #{@t.in_match}\n"
    res += "Vainqueur #{@m.winner} en #{@m.timer.div(60)} minutes et #{@m.timer % 60} secondes"

    expect(@m.to_s).to eql res
  end

  it "have a winner" do
    expect(@m.winner).to be_kind_of Joueur
  end
end
