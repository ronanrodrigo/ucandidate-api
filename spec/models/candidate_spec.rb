require 'rails_helper'

RSpec.describe Candidate, type: :model do
  before(:each) do
    @candidate = build(:candidate)
  end

  it "expect Candidate be save" do
    expect(@candidate.save).to be true
  end

  it "expect Candidate not be save" do
    @candidate.email = nil
    @candidate.name = nil
    expect(@candidate.save).to be false
  end

  it "expect Candidate has knowledges" do
    knowledge = build(:knowledge, candidate: @candidate)
    @candidate.save
    expect(@candidate.knowledges.count).to eq 1
  end
end
