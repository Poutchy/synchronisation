# frozen_string_literal: true

# contient les informations et la logique des arbitres
class Arbitre
  attr_accessor :terrain
  attr_reader :nom, :prenom

  def initialize(nom, prenom)
    @nom = nom
    @prenom = prenom
    @terrain = nil
  end

  def to_s
    "Arbitre #{nom} #{prenom}"
  end
end
