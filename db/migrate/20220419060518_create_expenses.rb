class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.references :user, null: false, foreign_key: { to_table: 'users'}, index: true
      t.name :name
      t.decimal :amount
      t.timestamps
    end
  end
end
