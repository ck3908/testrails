class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :title
      t.string :author
      t.text :content
      t.integer :rating
      t.references :movie, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
