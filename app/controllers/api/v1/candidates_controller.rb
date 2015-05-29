class API::V1::CandidatesController < ApplicationController
  before_action :set_candidate, only: :show

  # GET /candidates/1
  # GET /candidates/1.json
  def show
  end

  # POST /candidates
  # POST /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.json { render :show, status: :created, location: api_candidate_path(@candidate) }
      else
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def candidate_params
      params.require(:candidate).permit(:name, :email)
    end
end