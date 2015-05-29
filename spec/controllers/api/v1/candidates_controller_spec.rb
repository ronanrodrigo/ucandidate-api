require 'rails_helper'
require 'api/v1/candidates_controller'

module Api
  module V1
    RSpec.describe CandidatesController, type: :controller do
      headers

      let(:valid_attributes) {
        attributes_for(:candidate)
      }

      let(:invalid_attributes) {
        {name: nil, email: nil}
      }

      let(:valid_session) {
        {}
      }

      describe "GET #show" do
        it "assigns the requested candidate as @candidate" do
          candidate = Candidate.create! valid_attributes
          get :show, {:id => candidate.to_param}, valid_session
          expect(assigns(:candidate)).to eq(candidate)
        end
      end

      describe "POST #create" do
        context "with valid params" do
          it "creates a new Candidate" do
            expect {
              post :create, {:candidate => valid_attributes}, valid_session
            }.to change(Candidate, :count).by(1)
          end

          it "assigns a newly created candidate as @candidate" do
            post :create, {:candidate => valid_attributes}, valid_session
            expect(assigns(:candidate)).to be_a(Candidate)
            expect(assigns(:candidate)).to be_persisted
          end

          it "get a JSON of created candidate" do
            post :create, {:candidate => valid_attributes}, valid_session
            candidate = JSON.parse(response.body, symbolize_names: true)
            expect(candidate).to be_a_kind_of(Hash)
            expect(candidate[:name]).to eq(valid_attributes[:name])
          end
        end

        context "with invalid params" do
          it "assigns a newly created but unsaved candidate as @candidate" do
            post :create, {:candidate => invalid_attributes}, valid_session
            expect(assigns(:candidate)).to be_a_new(Candidate)
          end
        end
      end


    end
  end
end
