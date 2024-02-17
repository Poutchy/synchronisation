# frozen_string_literal: true

class Match
  attr_reader :joueur1, :joueur2

  def initialize(joueur1, joueur2)
    @joueur1 = joueur1
    @joueur2 = joueur2
  end

  def to_s
    "Match: #{joueur1} VS #{joueur2}"
  end
end
