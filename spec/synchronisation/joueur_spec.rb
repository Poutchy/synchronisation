# frozen_string_literal: true

require "synchronisation/joueur"

RSpec.describe Synchronisation do
  it "Have a name" do
    j = Synchronisation::Joueur.new("Mauti", "Enzo", 20)
    expect(j.to_s).to eq("Joueur Mauti Enzo - 20")
  end
end
