# frozen_string_literal: true

require 'concurrent/semaphore'

# contient les informations et la logique des arbitres
class Terrain< Semaphore
  attr_reader :arbitres

  def initialize(nb, arbitres)
    @arbitres = arbitres
    super
  end
end