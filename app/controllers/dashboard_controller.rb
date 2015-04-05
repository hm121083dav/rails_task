class DashboardController < ApplicationController

  #Загрузка стартовой страницы юзерской части
  def index
    @tickets = Ticket.new
    @teams = Team.all

    respond_to do |format|
      format.html
    end
  end

  #Добавление заявки пользователем в тех поддержку
  def tickets
    @tickets = Ticket.new(ticket_params)
    @teams = Team.all

    @tickets.status_id=1
    @tickets.ticket_name="#{@teams.find(ticket_params['team_id'])[:short_name]}-#{SecureRandom.hex}" if ticket_params['team_id']

    respond_to do |format|
      if @tickets.save
        SupportMailer.tickets_create(@tickets).deliver_now
        format.html { redirect_to root_path, notice: 'Ticket was successfully created.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  def show
    @ticket = Ticket.find_by_ticket_name(params['id'])
    respond_to do |format|
      format.html
    end
  end

  private

  #Данные с формы
  def ticket_params
    params.require(:ticket).permit(:customer_name, :customer_email, :team_id, :subject, :description)
  end

end