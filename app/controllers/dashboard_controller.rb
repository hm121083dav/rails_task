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
    form_params = params.require(:ticket).permit(:customer_name, :customer_email, :team_id, :subject, :description)
    @tickets = Ticket.new(form_params)
    @teams = Team.all

    @tickets.status_id=1
    @tickets.ticket_name="#{@teams.find(form_params['team_id'])[:short_name]}-#{SecureRandom.hex}" if form_params['team_id']

    respond_to do |format|
      if @tickets.save
        # SupportMailer.tickets_create(@tickets).deliver_now
        format.html { redirect_to root_path, notice: 'Заявка была успешно сформирована.' }
      else
        format.html { render action: 'index' }
      end
    end
  end

  def show
    @ticket = Ticket.find_by_ticket_name(params['id'])
    @logs = Log.all.where('ticket_id = ?', @ticket.id)
    respond_to do |format|
      format.html
    end
  end

end