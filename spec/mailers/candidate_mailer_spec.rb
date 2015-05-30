require "rails_helper"

RSpec.describe CandidateMailer, type: :mailer do
  describe "thanks generic programer" do
    before(:each) do 
      @candidate = create(:candidate)
      create(:knowledge, candidate: @candidate)
    end

    let(:mail) { CandidateMailer.thanks(@candidate, "generic") }

    it "renders the headers" do
      expect(mail.subject).to eq(I18n.t("candidate_mailer.thanks.subject"))
      expect(mail.to).to eq([@candidate.email])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Olá #{@candidate.name}\r\n\r\nObrigado por se candidatar, assim que tivermos uma vaga disponível para programador(a) entraremos em contato.")
    end
  end

end
