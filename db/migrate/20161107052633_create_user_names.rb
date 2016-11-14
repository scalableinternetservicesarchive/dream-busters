class CreateUserNames < ActiveRecord::Migration[5.0]
  def change
    create_table :usernames do |t|
      t.belongs_to :user, index: true
      t.string :username
      t.timestamps
    end
  end
end
