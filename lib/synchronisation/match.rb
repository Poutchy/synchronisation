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

  # Choisi le vainqueur du match
  # @return [Joueur] le joueur gagnant
  def winner
    @winner ||= choose_winner
  end

  # La fonction qui fait le choix du vainqueur une seule fois
  # @return [Joueur] le joueur gagnant
  def choose_winner
    joueur1 unless joueur2
    [joueur1, joueur2].sample
  end

  # Choisi la durée du match
  # @return [Integer] la durée du match
  def timer
    @timer ||= choose_timer
  end

  # La fonction qui fait le choix de la durée du match une seule fois
  # @return [Integer] la durée du match
  def choose_timer
    rand(20..180)
  end

  # Choisi le temps d'attente entre les matchs
  # @return [Integer] le temps d'attente
  def tps_attente
    20
  end

  # Libère tous les ressources utilisées par le match
  def release_all
    @terrain.end_match
    @terrain.release
    @semaphore.release
  end

  # Lance le match
  # @return [Joueur] le gagnant du match
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

  # Choisi le terrain du match
  # @param [Integer] id l'index du terrain à choisir
  # la fonction trouvera toujours un terrain disponible
  # @return [Terrain] le terrain choisi
  def choose_terrain(id = 0)
    t = @terrains.sample
    t = choose_terrain id + 1 unless t.try_acquire(1)
    t
  end
end
