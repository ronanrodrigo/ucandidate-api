class Candidate
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String

  validates :name, :email, presence: true

  embeds_many :knowledges

  def knowledges_attributes= data
    data.each do |attributes|
      knowledge = Knowledge.new(attributes)
      knowledge.candidate = self if knowledge.valid?
    end
  end
end
