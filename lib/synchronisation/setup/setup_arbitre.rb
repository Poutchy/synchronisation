# frozen_string_literal: true

require "synchronisation/arbitre_terrain"

# contient la manière de configurer des arbitres de terrain
class SetupArbitreTerrain
  def initialize
    @arbitres = []
    setup
  end

  def setup
    @arbitres << ArbitreTerrain.new("L'éponge", "Bob")
    @arbitres << ArbitreTerrain.new("Mouse", "Mickey")
    @arbitres << ArbitreTerrain.new("Doo", "Scooby")
    @arbitres << ArbitreTerrain.new("Runner", "Road")
    @arbitres << ArbitreTerrain.new("Bird", "Titi")
    @arbitres << ArbitreTerrain.new("Rose", "Panthère")
    @arbitres << ArbitreTerrain.new("Mouse", "Minnie")
    @arbitres << ArbitreTerrain.new("Eeyore", "Bourriquet")
    @arbitres << ArbitreTerrain.new("Chalamet", "Timothé")
    @arbitres << ArbitreTerrain.new("Yaeger", "Eren")
    @arbitres << ArbitreTerrain.new("Ackerman", "Mikasa")
    @arbitres << ArbitreTerrain.new("Okumura", "Rin")
    @arbitres << ArbitreTerrain.new("Moriarty", "William")
    @arbitres << ArbitreTerrain.new("Moran", "Sebastian")
    @arbitres << ArbitreTerrain.new("Bond", "James")
    @arbitres << ArbitreTerrain.new("Holmes", "Sherlock")
    @arbitres << ArbitreTerrain.new("Holmes", "Mycroft")
    @arbitres << ArbitreTerrain.new("Moriarty", "Albert")
  end

  def create
    res = []
    @arbitres.shuffle!
    3.times do
      res << @arbitres.shift
    end
    res
  end
end
