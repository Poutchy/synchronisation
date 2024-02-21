# frozen_string_literal: true

require "concurrent-ruby"

# contient les informations et la logique des arbitres
class Terrain < Concurrent::Semaphore
  attr_reader :arbitres

  def initialize(count, arbitres)
    @arbitres = arbitres
    super(count)
  end
end
