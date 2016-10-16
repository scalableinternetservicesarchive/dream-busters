class CreateDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :docs do |t|
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
end
