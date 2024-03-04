# frozen_string_literal: true

require "synchronisation/joueur"

# contient la manière de configurer des joueurs
class SetupJoueur
  def initialize(number)
    @number = number
  end

  def create
    res = create8 if @number == 8
    res = create16 if @number == 16
    res
  end

  def create8
    j1 = Joueur.new "Mauti", "Joris", 19
    j2 = Joueur.new "Mauti", "Enzo", 20
    j3 = Joueur.new "Rey", "Guillaume", 21
    j4 = Joueur.new "Parran", "Gabin", 20
    j5 = Joueur.new "Vaglio", "Lisa", 20
    j6 = Joueur.new "Abry", "Maxime", 20
    j7 = Joueur.new "Simon", "Théo", 20
    j8 = Joueur.new "Demeulenaere", "Bastien", 20
    [j1, j2, j3, j4, j5, j6, j7, j8]
  end

  def create16
    j1 = Joueur.new "Mauti", "Enzo", 20
    j2 = Joueur.new "Rey", "Guillaume", 20
    j3 = Joueur.new "Vaglio", "Lisa", 20
    j4 = Joueur.new "Abry", "Maxime", 20
    j5 = Joueur.new "Simon", "Théo", 20
    j6 = Joueur.new "Demeulenaere", "Bastien", 20
    j7 = Joueur.new "Egloff", "Baptiste", 20
    j8 = Joueur.new "Bouvelot", "Roxane", 20
    j9 = Joueur.new "Luque", "Mattéo", 20
    j10 = Joueur.new "Chevalier", "Clément", 20
    j11 = Joueur.new "Dupraz", "Léo", 20
    j12 = Joueur.new "Rousseau", "Thomas", 20
    j13 = Joueur.new "Mauclair", "Nicolas", 20
    j14 = Joueur.new "Meziere", "Evan", 20
    j15 = Joueur.new "Leonarduzzi", "Alexis", 20
    j16 = Joueur.new "Rousseau", "Maxime", 20
    [j1, j2, j3, j4, j5, j6, j7, j8, j9, j10, j11, j12, j13, j14, j15, j16]
  end
end
