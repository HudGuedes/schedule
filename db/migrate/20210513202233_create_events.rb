class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :user, null: false, foreign_key: true
      t.string :description,  null: false
      t.datetime :initial_date,  null: false
      t.datetime :final_date, null: false
      t.timestamps
    end
  end
end
