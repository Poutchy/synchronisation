# frozen_string_literal: true

require "synchronisation/arbitre"

class ArbitreTerrain < Arbitre
  attr_reader :nom, :prenom

  def to_s
    "Arbitre de Terrain: #{nom} #{prenom}"
  end
end
