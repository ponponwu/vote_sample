# For Access
### Issue:  has_many -> IssueRecord
  column:  title, content: ,status, created_at, updated_at

### IssueRecord
  column:  user_id, issue_id, status, is_agree, created_at, updated_at

  index issue_id, user_id, is_agree
  PK user_id, issue_id

### User: has_many -> IssueRecord
  column:name, status
