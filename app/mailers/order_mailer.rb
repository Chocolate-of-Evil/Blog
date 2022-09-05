class OrderMailer < ApplicationMailer
		default to: 'gospozatemnaa@gmail.com'

	def contacts_mail(params)
		#@name = params[:name]
    	@email = params[:email]
    	@message = params[:message]
    	@url = 'http://localhost:3000/'
    	mail(subject: "Rails Blog")
	end
end
