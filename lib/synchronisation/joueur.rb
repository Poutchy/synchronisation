# frozen_string_literal: true

# contient les informations d'un joueur
class Joueur
  attr_accessor :nom, :prenom, :age

  def initialize(nom, prenom, age)
    @nom = nom
    @prenom = prenom
    @age = age
  end

  def to_s
    "Joueur #{nom} #{prenom} - #{age}"
  end
end
