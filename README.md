# For Access
Issue  has_many IssueRecord
  column:  title, content: ,status, created_at, updated_at

IssueRecord
  column:  user_id, issue_id, status, agreement, created_at, updated_at

  index issue_id, user_id
  uniq user_id, issue_id

User has_many IssueRecord
  column:name, status
