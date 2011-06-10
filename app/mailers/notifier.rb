class Notifier < ActionMailer::Base
  default :from => "Lucky Zhang <lucky.univ@gmail.com>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_received.subject
  #
  def order_received(order)
    @order = order
    @greeting = "Hi"

    mail :to => order.email, :subject => 'Lucky BookStore Order COnfirmation'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifier.order_shipped.subject
  #
  def order_shipped
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
