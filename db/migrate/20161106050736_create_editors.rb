class CreateEditors < ActiveRecord::Migration[5.0]
  def change
    create_table :editors do |t|
      t.string :filename
      t.string :hashpath

      t.timestamps
    end
  end
end
