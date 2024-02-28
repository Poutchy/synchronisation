# frozen_string_literal: true

require "concurrent-ruby"

# contient les informations et la logique des arbitres
class Terrain < Concurrent::Semaphore
  attr_reader :arbitres, :arbitre_table, :arbitre_en_cours

  def initialize(arbitres, arbitre_table)
    @arbitres = arbitres
    @arbitre_table = arbitre_table
    @arbitre_en_cours = nil
    arbitre_table.give_terrain self
    super(1)
  end

  def in_match
    "Arbitre de table: #{@arbitre_table}\nArbitre en cours: #{@arbitre_en_cours}"
  end

  def def_arbitre
    @arbitre_en_cours = choose_arbitre
    arbitre_table.acquire(2)
  end

  def choose_arbitre(id = 0)
    a = arbitres[id]
    a = choose_arbitre id + 1 unless a.try_acquire(2, 1)
    a
  end

  def end_match
    arbitres.each do |a|
      a.release(1) if a.available_permits < 1
    end
    arbitre_table.release(2)
  end

  def to_s
    r = "Terrain:\nArbitres de terrains:\n"
    arbitres.each do |a|
      r += "  #{a}\n"
    end
    r += "Arbitre de table:\n  #{@arbitre_table}"
    r
  end
end
