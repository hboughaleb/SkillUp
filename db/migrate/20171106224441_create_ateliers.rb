class CreateAteliers < ActiveRecord::Migration[5.0]
  def change
    create_table :ateliers do |t|
      t.datetime :date
      t.boolean :completed, default: false
      t.references :user, foreign_key: true
      t.references :skill, foreign_key: true

      t.timestamps
    end
  end
end
