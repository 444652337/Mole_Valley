class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :content

      t.timestamps
    end
  end
end
