class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.belongs_to :editor, index: true
      t.string :speaker
      t.string :content
      t.timestamps
    end
  end
end
