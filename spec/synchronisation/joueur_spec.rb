# frozen_string_literal: true

require "synchronisation/joueur"

RSpec.describe Joueur do
  it "Can be printed" do
    j = Joueur.new("Mauti", "Enzo", 20)
    expect(j.to_s).to eq("Joueur Mauti Enzo - 20")
  end
end
