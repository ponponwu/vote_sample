class CreateIssueRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_records do |t|
      t.references :user, null: false, foreign_key: true
      t.references :issue, null: false, foreign_key: true
      t.boolean :agreement
      t.string :status

      t.timestamps
    end
  end
end
