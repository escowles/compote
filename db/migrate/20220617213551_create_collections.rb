class CreateCollections < ActiveRecord::Migration[7.0]
  def change
    create_table :collections do |t|
      t.string :manifest_url
      t.string :html_url
      t.string :label

      t.timestamps
    end
  end
end
