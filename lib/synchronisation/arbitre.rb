# frozen_string_literal: true

# contient les informations et la logique des arbitres
class Arbitre
  attr_reader :nom, :prenom, :terrain

  def initialize(nom, prenom, terrain)
    @nom = nom
    @prenom = prenom
    @terrain = terrain
  end

  def to_s
    "Arbitre #{nom} #{prenom}"
  end
end
