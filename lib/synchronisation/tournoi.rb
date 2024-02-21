# frozen_string_literal: true

# contient les informations et la logique d'un tournoi
class Tournoi
  attr_reader :joueurs, :terrains

  def initialize(joueurs, terrains)
    @joueurs = joueurs
    @terrains = terrains
  end

  def run
    until joueurs.size == 1
      matchs = create_matchs
      threads = creates_threads matchs
      threads.each do |t|
        t.join
        joueurs << t[:winner]
      end
    end
    joueurs.first
  end

  private

  def create_matchs
    matchs = []
    matchs.add Match.new joueurs.shift joueurs.shift until joueurs.size > 1
    matchs
  end

  def creates_threads(matchs)
    threads = []
    matchs.each do |m|
      threads << Thread.new { Thread.current[:winner] = m.run }
    end
  end
end
