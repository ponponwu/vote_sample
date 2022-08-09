class IssueRecordsController < ApplicationController
  before_action :set_issue, only: %i[ show update destroy ]

  def create
    @issues = Issue.all

    render json: @issues
  end

  # POST /issue_records
  def vote
    if (issue = IssueRecords.find_by(issue_id: issue_records_params[:issue_id], user_id: issue_records_params[:user_id], is_agree: issue_records_params[:is_agree]))
      issue.update!(is_agree: issue_records_params[:is_agree])
    else
      IssueRecords.create(issue_records_params)
    end
    
  end

  private

  def issue_records_params
    params.require(:issue_record).permit(:user_id, :issue_id, :is_agree)
  end

end