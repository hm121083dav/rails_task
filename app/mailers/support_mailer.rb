class SupportMailer < ApplicationMailer
  default from: 'duxa_vena@rambler.ru'

  # Отправка письма с сообщением пользователю о том,
  # что его заявка принята с ссылкой на страничку просмотра статуса заявки
  def tickets_create(ticket)
    @ticket = ticket
    mail(to: @ticket.customer_email, subject: @ticket.subject) do |format|
      format.html { render 'support_mailer/tickets_create' }
    end
  end

  # Отправка письма с сообщением пользователю об изменении состояния заявки
  def change(ticket)
    @ticket = ticket
    @logs = Log.find_by_ticket_id(ticket.id)
    mail(:to => @ticket.customer_email, :subject => @ticket.subject) do |format|
      format.html { render 'support_mailer/change' } #TODO
    end
  end

  # Отправка письма с сообщением пользователю от сотрудника персонала техподдержки
  def writetouser(ticket, log)
    @ticket, @log = ticket, log
    @logs = Log.find_by_ticket_id(ticket.id)
    mail(to: @ticket.customer_email, subject: @ticket.subject) do |format|
      format.html { render 'support_mailer/writetouser' } #TODO
    end
  end

end