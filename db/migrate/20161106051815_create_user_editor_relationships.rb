class CreateUserEditorRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :user_editor_relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :editor, index: true
      t.timestamps
    end
  end
end
