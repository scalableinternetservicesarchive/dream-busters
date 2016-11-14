class Editor < ApplicationRecord
	extend FriendlyId
	friendly_id :hashpath

	has_many :user_editor_relationships
  	has_many :users, :through => :user_editor_relationships
  	has_many :messages

	def get_content
		@hashpath = self.hashpath
		file = File.open("/tmp/"+@hashpath+"/file.txt", "rb")
		file.read
	end

	def set_content(content, username)
		@editor_id = self.id
		system("git -C /tmp/"+@hashpath+" checkout ".concat(username))

		# write
		File.open("/tmp/"+@hashpath+"/file.txt", 'w') do |f2|
			f2.puts content
		end

		system("git -C /tmp/"+@hashpath+" add /tmp/"+@hashpath+"/file.txt")
		system("git -C /tmp/"+@hashpath+" commit -m \"".concat(username).concat("\""))

		system("git -C /tmp/"+@hashpath+" checkout master")

		system("git -C /tmp/"+@hashpath+" merge ".concat(username))
	end
	

end
