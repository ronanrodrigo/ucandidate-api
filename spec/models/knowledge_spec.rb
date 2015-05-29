require 'rails_helper'

RSpec.describe Knowledge, type: :model do
  before(:each) do
    @candidate = create(:candidate)
    @knowledge = build(:knowledge, candidate: @candidate)
  end

  it "expect Knowledge be save" do
    expect(@knowledge.save).to be true
  end

  it "expect overpowered Knowledge not be save" do
    @knowledge = build(:overpowered, candidate: @candidate)
    expect(@knowledge.save).to be false
  end
end
