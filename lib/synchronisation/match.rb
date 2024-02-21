# frozen_string_literal: true

# contient les informations et la logique d'un match
class Match
  attr_reader :joueur1, :joueur2

  def initialize(joueur1, joueur2)
    @joueur1 = joueur1
    @joueur2 = joueur2
  end

  def to_s
    "Match: #{joueur1} VS #{joueur2}"
  end

  def winner
    winner ||= choose_winner
  end

  def choose_winner
    joueur1 unless joueur2
    [joueur1, joueur2].sample
  end
end
