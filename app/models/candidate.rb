class Candidate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String

  validates :name, :email, presence: true
end
