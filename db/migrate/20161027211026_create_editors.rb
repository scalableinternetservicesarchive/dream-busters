class CreateEditors < ActiveRecord::Migration[5.0]
  def change
    create_table :editors do |t|
      t.string :path
      t.string :user1
      t.string :user2
      t.string :user3
      t.string :user4
      t.string :user5

      t.timestamps
    end
  end
end
