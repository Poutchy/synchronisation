# frozen_string_literal: true

# contient les informations et la logique d'un match
class Match
  attr_reader :joueur1, :joueur2
  attr_accessor :terrain

  def initialize(joueur1, joueur2, terrains)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @winner = nil
    @timer = nil
    @terrains = terrains
    @terrain = nil
  end

  def to_s
    res = "Match terminé\n" if @winner
    res = "Match: #{joueur1} VS #{joueur2}\n" unless @winner
    res += "Match: #{joueur1} VS #{joueur2}\n" if @winner
    res += "Terrain: #{@terrain.in_match}\n"
    res += "Vainqueur #{@winner} en #{timer.div(60)} minutes et #{timer % 60} secondes" if @winner
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
    rand(10..180)
  end

  def run
    @terrain = choose_terrain
    @terrain.def_arbitre
    puts self
    sleep(timer)
    winner
    puts self
    @terrain.end_match
    @terrain.release
    sleep(20)
    winner
  end

  def choose_terrain
    t = @terrains.sample
    t = choose_terrain unless t.try_acquire(1, 10)
    t
  end
end
