# frozen_string_literal: true

# contient les informations et la logique d'un match
class Match
  attr_reader :joueur1, :joueur2
  attr_accessor :terrain

  def initialize(joueur1, joueur2, terrains, semaphore = nil)
    @joueur1 = joueur1
    @joueur2 = joueur2
    @winner = nil
    @timer = nil
    @terrains = terrains
    @terrain = nil
    @semaphore = semaphore
  end

  def to_s
    res = "\n"
    res += "Match terminé\n" if @winner
    res += "Match: #{joueur1} VS #{joueur2}\n" unless @winner
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
    rand(20..180)
  end

  def tps_attente
    20
  end

  def release_all
    @terrain.end_match
    @terrain.release
    @semaphore.release
  end

  def run
    @semaphore.acquire(1)
    @terrain = choose_terrain
    @terrain.def_arbitre
    puts self
    sleep(timer)
    winner
    puts self
    release_all
    sleep(tps_attente)
    winner
  end

  def choose_terrain(id = 0)
    t = @terrains.sample
    t = choose_terrain id + 1 unless t.try_acquire(1)
    t
  end
end
