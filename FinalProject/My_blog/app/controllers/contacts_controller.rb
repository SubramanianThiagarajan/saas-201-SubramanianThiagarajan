class ContactsController < ApplicationController
	
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.valid?
			ContactMailer.general_message(@contact).deliver_now
			flash[:success] = "Your message sent successfully"
			redirect_to action: "new"
		else
			flash[:danger] = @contact.errors.values.join(", ")
			redirect_to action: "new"
		end
	end

	private

	def contact_params
		params[:contact].permit(:name,:message,:email)
	end
end
