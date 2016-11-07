class UserEditorRelationship < ApplicationRecord
  belongs_to :editor
  belongs_to :user
end
