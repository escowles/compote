class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :image_url
      t.integer :sort
      t.references :manifest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
