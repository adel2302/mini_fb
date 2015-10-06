class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.references :user_a, index: true, foreign_key: true
      t.references :user_b, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
