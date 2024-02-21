# frozen_string_literal: true

require "synchronisation/arbitre"

# Contiens les informations d'un arbitre de table
class ArbitreTable < Arbitre
  def to_s
    "Arbitre de Terrain: #{nom} #{prenom}"
  end
end
