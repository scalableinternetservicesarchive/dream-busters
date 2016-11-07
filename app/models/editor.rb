class Editor < ApplicationRecord
	def self.default_content
		"hello world"
	end
	
	has_many :user_editor_relationships
  	has_many :users, :through => :user_editor_relationships
  	has_many :messages
end
