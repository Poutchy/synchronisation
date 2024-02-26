# frozen_string_literal: true

# contient les informations et la logique d'un tournoi
class Tournoi
  attr_reader :joueurs, :terrains

  def initialize(joueurs, terrains)
    @joueurs = joueurs
    @terrains = terrains
  end

  def run
    puts self
    round until joueurs.size == 1
    joueurs.first
  end

  private

  def round
    matchs = create_matchs
    threads = creates_threads matchs
    threads.each do |t|
      t.join
      joueurs << t[:winner]
    end
  end

  def create_matchs
    matchs = []
    matchs << Match.new(joueurs.shift, joueurs.shift, terrains) until joueurs.size < 2
    matchs
  end

  def creates_threads(matchs)
    threads = []
    matchs.each do |m|
      threads << Thread.new { Thread.current[:winner] = m.run }
    end
    threads
  end

  def to_s
    res = "Tournoi avec #{joueurs.size} joueurs et #{terrains.size} terrains"
    res += "\nJoueurs: #{joueurs.join(", ")}"
    res += "\nTerrains:\n"
    terrains.each do |t|
      res += "  #{t}\n"
    end
    res
  end
end
