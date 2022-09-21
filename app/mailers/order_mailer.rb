# frozen_string_literal: true

class OrderMailer < ApplicationMailer
  default to: 'gospozatemnaa@gmail.com'

  def contacts_mail(params)
    @email = params[:email]
    @message = params[:message]
    @url = 'http://localhost:3000/'
    mail(subject: 'Rails Blog')
  end
end
