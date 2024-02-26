# frozen_string_literal: true

require "synchronisation/arbitre"

# Contiens les informations d'un arbitre de table
class ArbitreTable < Arbitre
  def give_terrain(terrain)
    @terrain = terrain
  end

  def to_s
    "Arbitre de Terrain: #{nom} #{prenom}"
  end
end
