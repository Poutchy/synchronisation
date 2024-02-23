# frozen_string_literal: true

# contient les informations et la logique d'un match
class Match
  attr_reader :joueur1, :joueur2, :terrain

  def initialize(joueur1, joueur2, terrains)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @winner = nil
    @timer = nil
    @terrain = choose_terrain terrains
  end

  def to_s
    res = "Match: #{joueur1} VS #{joueur2}\n"
    res += "Vainqueur #{winner} en #{timer.div(60)} minutes et #{timer % 60} secondes"
    res
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
    rand(2..30)
  end

  def run
    puts timer
    sleep(timer)
    puts "Match terminé"
    puts self
    terrain.release
    winner
  end

  def choose_terrain(terrains)
    t = terrains.sample
    t = choose_terrain(terrains) if !t.try_acquire(1, 30)
    t
  end
end
