# frozen_string_literal: true

# contient les informations et la logique d'un match
class Match
  attr_reader :joueur1, :joueur2

  def initialize(joueur1, joueur2)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @winner = nil
    @timer = nil
    @terrain = nil
  end

  def to_s
    "Match: #{joueur1} VS #{joueur2}\n" + "Vainqueur #{winner} en #{timer.div(60)} minutes et #{timer%60} secondes"
  end

  def winner
    @winner ||= choose_winner
  end

  def choose_winner
    joueur1 unless joueur2
    [joueur1, joueur2].sample
  end

  def timer
    @timer ||= choose_timer
  end

  def choose_timer
    Random.rand(180)
  end
end
