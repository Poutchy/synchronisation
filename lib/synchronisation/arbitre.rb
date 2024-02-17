# frozen_string_literal: true

class Arbitre
  attr_reader :nom, :prenom

  def initialize(nom, prenom)
    @nom = nom
    @prenom = prenom
  end
end
