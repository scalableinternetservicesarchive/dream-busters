class CreateUserNames < ActiveRecord::Migration[5.0]
  def change
    create_table :user_names do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.timestamps
    end
  end
end
