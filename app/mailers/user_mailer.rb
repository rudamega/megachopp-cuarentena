class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"
    @cart = params[:cart]
    mail to: "ruben@megachopp.com.py"
  end

  def confirmado
    @cart = params[:cart]
    mail(
      to: @cart.email,
      subject: "PEDIDO DEL #{@cart.date} CONFIRMADO"
    )
  end
end
