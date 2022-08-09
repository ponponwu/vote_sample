class ChangeIssureRecordsColumn < ActiveRecord::Migration[7.0]
  def change
    change_table :issue_records do |t|
      t.rename :agreement, :is_agree
    end

    change_column :issue_records, :status, :string, :default => 'active'
    change_column :issues, :status, :string, :default => 'active'
  end
end
