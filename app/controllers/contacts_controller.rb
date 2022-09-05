class ContactsController < ApplicationController
	def new
	  p ENV['GMAIL_USER']
	  p ENV['GMAIL_PASSWORD']
	end

	def create
    	OrderMailer.contacts_mail(contacts_params).deliver_now
    	redirect_to root_path, notice: 'Message sent'
  	end

	private

	def contacts_params
    	params.permit( :email, :message, :authenticity_token, :commit)
  	end
end
