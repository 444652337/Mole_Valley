class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :name
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
