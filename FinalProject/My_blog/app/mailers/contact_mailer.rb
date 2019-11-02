class ContactMailer < ApplicationMailer
	def general_message(contact)
		@contact = contact
		mail(:to => "subbuthiagu@gmail.com", :subject => "New mail")
	end
end
