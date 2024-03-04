# frozen_string_literal: true

# contient la manière de configurer des joueurs
class SetupJoueur
  def initialize(number)
    @number = number
  end

  def create
    create8 if number == 8
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
end
