class SupportMailer < ApplicationMailer
  default from: 'duxa_vena@rambler.ru'

  def tickets_create(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email, subject: 'no-reply MarmotSupport System') do |format|
      format.html { render 'support_mailer/tickets_create' }
      format.text { render 'support_mailer/tickets_create' }
    end
  end
end