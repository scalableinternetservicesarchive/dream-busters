class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :editor_id
      t.string :speaker
      t.text :content

      t.timestamps
    end
  end
end
