# frozen_string_literal: true

require "synchronisation/match"
require "synchronisation/joueur"

RSpec.describe Match do
  before :each do
    @j1 = Joueur.new "Mauti", "Joris", 19
    @j2 = Joueur.new "Mauti", "Enzo", 20
  end
  it "can be printed" do
    m = Match.new @j1, @j2
    expect(m.to_s).to eql "Match: #{@j1} VS #{@j2}"
  end
end
