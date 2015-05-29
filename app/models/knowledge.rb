class Knowledge
  include Mongoid::Document

  field :item, type: String
  field :level, type: Integer

  validates :level, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 10, only_integer: true}

  embedded_in :candidate
end
