class CreateManifests < ActiveRecord::Migration[7.0]
  def change
    create_table :manifests do |t|
      t.string :label
      t.string :manifest_url
      t.string :html_url
      t.integer :sort
      t.references :collection, null: false, foreign_key: true

      t.timestamps
    end
  end
end
