class Editor < ApplicationRecord
	extend FriendlyId
	friendly_id :hashpath

	has_many :user_editor_relationships
  	has_many :users, :through => :user_editor_relationships
  	has_many :messages

	def get_content
		@editor_id = self.id
		file = File.open("/tmp/#{@editor_id}/file.txt", "rb")
		file.read
	end

	def set_content(content, username)
		@editor_id = self.id
		system("git -C /tmp/#{@editor_id} checkout ".concat(username))

		# write
		File.open("/tmp/#{@editor_id}/file.txt", 'w') do |f2|
			f2.puts content
		end

		system("git -C /tmp/#{@editor_id} add /tmp/#{@editor_id}/file.txt")
		system("git -C /tmp/#{@editor_id} commit -m \"".concat(username).concat("\""))

		system("git -C /tmp/#{@editor_id} checkout master")

		system("git -C /tmp/#{@editor_id} merge ".concat(username))
	end
	

end
