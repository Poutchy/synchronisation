# frozen_string_literal: true

require "concurrent-ruby"

# contient les informations et la logique des arbitres
class Terrain < Concurrent::Semaphore
  attr_reader :arbitres, :arbitre_table, :arbitre_en_cours

  def initialize(arbitres, arbitre_table)
    @arbitres = arbitres
    @arbitre_table = arbitre_table
    @arbitre_en_cours = nil
    super(1)
  end

  # Retourne un affichage du terrain lors d'un match
  # @return [String] l'affichage du terrain
  def in_match
    "Arbitre de table: #{@arbitre_table}\nArbitre en cours: #{@arbitre_en_cours}"
  end

  # Définit l'arbitre en cours
  def def_arbitre
    @arbitre_en_cours = choose_arbitre
    arbitre_table.acquire(3)
  end

  # Choisi un arbitre pour le match
  # @param [Integer] id l'id de l'arbitre à choisir
  # la fonction trouvera toujours un terrain disponible
  # @return [Arbitre] l'arbitre choisi
  def choose_arbitre(id = 0)
    a = arbitres[id]
    a = choose_arbitre id + 1 unless a.try_acquire(3, 1)
    a
  end

  # Libère les arbitres
  def end_match
    arbitres.each do |a|
      a.release(1) if a.available_permits < 3
    end
    arbitre_table.release(3)
  end

  def to_s
    r = "Arbitres de terrains:\n"
    arbitres.each do |a|
      r += "  #{a}\n"
    end
    r += "Arbitre de table:\n  #{@arbitre_table}"
    r
  end
end
