# frozen_string_literal: true

# contient les informations et la logique des arbitres
class Arbitre
  attr_reader :nom, :prenom

  def initialize(nom, prenom)
    @nom = nom
    @prenom = prenom
  end

  def to_s
    "Arbitre #{nom} #{prenom}"
  end
end
