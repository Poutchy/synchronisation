# frozen_string_literal: true

RSpec.describe Synchronisation do
  it "has a version number" do
    expect(Synchronisation::VERSION).not_to be nil
  end
end
