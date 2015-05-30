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

  def vacancies
    front_end = [/html/i, /css/i, /javascript/i]
    back_end = [/python/i, /django/i]
    mobile = [/desenvolvimento ios/i, /desenvolvimento android/i]
    vacancies = []
    vacancies << "front_end" if self.knowledges.where(:level.gte => 7).in(item: front_end).count == front_end.size
    vacancies << "back_end" if self.knowledges.where(:level.gte => 7).in(item: back_end).count == back_end.size
    vacancies << "mobile" if self.knowledges.where(:level.gte => 7).in(item: mobile).count == mobile.size
    vacancies << "generic" if vacancies.blank?

    return vacancies
  end
end
