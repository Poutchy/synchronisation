# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"
require "synchronisation/terrain"
require "synchronisation/arbitre_table"
require "synchronisation/arbitre_terrain"
require "synchronisation/tournoi"

def create_joueur
  j1 = Joueur.new "Mauti", "Joris", 19
  j2 = Joueur.new "Mauti", "Enzo", 20
  j3 = Joueur.new "Rey", "Guillaume", 21
  j4 = Joueur.new "Parran", "Gabin", 20
  j5 = Joueur.new "Vaglio", "Lisa", 20
  j6 = Joueur.new "Abry", "Maxime", 20
  j7 = Joueur.new "Simon", "Théo", 20
  j8 = Joueur.new "Demeulenaere", "Bastien", 20
  [j1, j2, j3, j4, j5, j6, j7, j8]
end

def a_t
  ArbitreTable.new "Lagaffe", "Gaston"
end

def l1
  a11 = ArbitreTerrain.new "Baqui", "Hanma"
  a12 = ArbitreTerrain.new "Baquo", "Hanmo"
  a13 = ArbitreTerrain.new "Baquu", "Hanmi"
  [a11, a12, a13]
end

def l2
  a21 = ArbitreTerrain.new "Tobey", "Mcgui"
  a22 = ArbitreTerrain.new "Tobu", "Mcguu"
  a23 = ArbitreTerrain.new "Toba", "Mcgua"
  [a21, a22, a23]
end

def l3
  a31 = ArbitreTerrain.new "Maco", "Tapo"
  a32 = ArbitreTerrain.new "Maci", "Trapon"
  a33 = ArbitreTerrain.new "Muca", "Trpua"
  [a31, a32, a33]
end

def create_terrain
  [Terrain.new(l1, a_t), Terrain.new(l2, a_t), Terrain.new(l3, a_t)]
end

def create
  joueurs = create_joueur
  terrains = create_terrain
  Tournoi.new joueurs, terrains
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
