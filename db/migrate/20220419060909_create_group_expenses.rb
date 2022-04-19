class CreateGroupExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :group_expenses do |t|
      t.references :group, null: false, foreign_key: { to_table: 'groups'}, index: true
      t.references :expense, null: false, foreign_key: { to_table: 'expenses'}, index: true
      t.timestamps
    end
  end
end
