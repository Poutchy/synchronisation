# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"
require "synchronisation/terrain"
require "synchronisation/arbitre_table"
require "synchronisation/arbitre_terrain"
require "synchronisation/tournoi"
require "synchronisation/setup/setup_joueur"
require "synchronisation/setup/setup_arbitre"

def create_joueur
  SetupJoueur.new(8).create
end

def a_t
  ArbitreTable.new "Lagaffe", "Gaston"
end

def l1
  SetupArbitreTerrain.new.create
end

def l2
  SetupArbitreTerrain.new.create
end

def l3
  SetupArbitreTerrain.new.create
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
