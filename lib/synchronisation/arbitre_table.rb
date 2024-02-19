# frozen_string_literal: true

require "synchronisation/arbitre"

# Contiens les informations d'un arbitre de table
class ArbitreTable < Arbitre
  attr_reader :nom, :prenom

  def to_s
    "Arbitre de Terrain: #{nom} #{prenom}"
  end
end
