# frozen_string_literal: true

# contient les informations et la logique d'un tournoi
class Tournoi
  attr_reader :joueurs, :terrains

  def initialize(joueurs, terrains)
    @joueurs = joueurs
    @terrains = terrains
    @nb_round = 0
    @semaphore_terrains = Concurrent::Semaphore.new(terrains.size)
  end

  # lance le tournoi
  # @return [Joueur] le vainqueur du tournoi
  def run
    puts self
    round until joueurs.size == 1
    puts "Fin du tournoi\nLe vainqueur est: #{joueurs.first}"
    joueurs.first
  end

  private

  # lance un round du tournoi
  def round
    puts "Round #{@nb_round += 1}"
    matchs = create_matchs
    threads = creates_threads matchs
    threads.each do |t|
      t.join
      joueurs << t[:winner]
    end
    puts "\nJoueurs restants: #{joueurs.join(", ")}"
  end

  # crée les matchs du round
  # @return [Array<Match>] les matchs du round
  def create_matchs
    matchs = []
    matchs << Match.new(joueurs.shift, joueurs.shift, terrains, @semaphore_terrains) until joueurs.size < 2
    matchs
  end

  # crée les threads pour les matchs
  # @param [Array<Match>] matchs les matchs à lancer
  # @return [Array<Thread>] les threads des matchs
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
      res += "  #{t}\n\n"
    end
    res
  end
end
