# frozen_string_literal: true

require "synchronisation/arbitre"

# contient les informations d'un arbitre de terrain et la logique associé
class ArbitreTerrain < Arbitre
  def to_s
    "Arbitre de Terrain: #{nom} #{prenom}"
  end
end
