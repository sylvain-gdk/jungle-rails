class ConfEmail < ApplicationMailer
  default from: "no-reply@jungle.com"

  def conf_email(order)
    @order = order
    mail(to: @order.email, subject: 'Thank you! - Order ##{@order.id}')
  end
end
