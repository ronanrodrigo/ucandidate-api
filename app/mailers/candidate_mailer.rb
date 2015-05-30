class CandidateMailer < ApplicationMailer
  def thanks candidate, vacancy
    @candidate = candidate
    @vacancy = I18n.t("candidate.vacancy.#{vacancy}")
    mail to: candidate.email
  end
end
