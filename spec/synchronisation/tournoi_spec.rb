# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"
require "synchronisation/terrain"
require "synchronisation/arbitre"
require "synchronisation/tournoi"

def create_joueur
  j1 = Joueur.new "Mauti", "Joris", 19
  j2 = Joueur.new "Mauti", "Enzo", 20
  j3 = Joueur.new "Rey", "Guillaume", 21
  j4 = Joueur.new "Parran", "Gabin", 20
  [j1, j2, j3, j4]
end

def create_terrain
  a11 = Arbitre.new "Baqui", "Hanma"
  a12 = Arbitre.new "Baquo", "Hanmo"
  a13 = Arbitre.new "Baquu", "Hanmi"
  a21 = Arbitre.new "Tobey", "Mcgui"
  a22 = Arbitre.new "Tobu", "Mcguu"
  a23 = Arbitre.new "Toba", "Mcgua"
  a31 = Arbitre.new "Maco", "Tapo"
  a32 = Arbitre.new "Maci", "Trapon"
  a33 = Arbitre.new "Muca", "Trpua"
  [Terrain.new(1, [a11, a12, a13]), Terrain.new(1, [a21, a22, a23]), Terrain.new(1, [a31, a32, a33])]
end

def create
  js = create_joueur
  t = create_terrain
  Tournoi.new js, t
end

RSpec.describe Tournoi do
  before do
    @tournoi = create
  end

  it "exist" do
    expect(@tournoi).to be_kind_of Tournoi
  end

  it "can run" do
    expect(@tournoi.run).to be_kind_of Joueur
  end
end
