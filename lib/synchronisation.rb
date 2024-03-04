# frozen_string_literal: true

require_relative "synchronisation/version"
require_relative "synchronisation/joueur"
require_relative "synchronisation/arbitre"
require_relative "synchronisation/arbitre_table"
require_relative "synchronisation/arbitre_terrain"
require_relative "synchronisation/match"
require_relative "synchronisation/tournoi"
require_relative "synchronisation/setup/setup_joueur"
require_relative "synchronisation/setup/setup_arbitre"

module Synchronisation
  class Joueur < Joueur; end
  class Arbitre < Arbitre; end
  class ArbitreTable < ArbitreTable; end
  class ArbitreTerrain < ArbitreTerrain; end
  class Match < Match; end
  class Tournoi < Tournoi; end
  class SetupJoueur < SetupJoueur; end
  class SetupArbitre < SetupArbitre; end
  class Error < StandardError; end
end
