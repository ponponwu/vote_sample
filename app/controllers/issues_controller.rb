class IssuesController < ApplicationController
  before_action :set_issue, only: %i[ show update destroy ]

  # GET /issues
  def index
    @issues = Issue.all

    render json: @issues
  end

  # GET /issues/1
  def show
    # { 'true' => 7, 'false' => 12 }
    records_approval_cnt = @issue.issue_records.group(:is_agree).count
    render json: {
      issue: @issue,
      agree: records_approval_cnt['true'],
      disagree: records_approval_cnt['false']
    }
  end

  # POST /issues
  def create
    @issue = Issue.new(issue_params)

    if @issue.save
      render json: @issue, status: :created, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /issues/1
  def update
    if @issue.update(issue_params)
      render json: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  def destroy
    @issue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def issue_params
      params.require(:issue).permit(:title, :content, :status)
    end
end
