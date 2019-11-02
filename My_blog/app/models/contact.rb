class Contact < ApplicationRecord
	attr_accessor :name, :message, :email

	validate :validate_name_message

	private

	def validate_name_message
		if self.name.strip == ''
			errors.add(:contact , "Name shouldn't be empty")
		elsif self.message.strip == ''
			errors.add(:contact , "Message shouldn't be empty")
		end
	end
end
