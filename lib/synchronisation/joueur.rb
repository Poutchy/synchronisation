# frozen_string_literal: true

require "concurrent-ruby"

# contient les informations d'un joueur
class Joueur < Concurrent::Semaphore
  attr_accessor :nom, :prenom, :age

  def initialize(nom, prenom, age)
    @nom = nom
    @prenom = prenom
    @age = age
    super(1)
  end

  def to_s
    "Joueur #{nom} #{prenom} - #{age}"
  end
end
