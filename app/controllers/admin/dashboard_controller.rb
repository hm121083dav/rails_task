class  Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  #Админ часть.Загрузка стартовой страници
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html
    end
  end

  #Назначение тикета сотруднику тех поддержки
  def assign_for_me_ticket
    ticket = Ticket.find_by_ticket_name(params['id'])
    begin
      ticket.update_attributes(status_id: 2, user_id: current_user.id)
      redirect_to admin_root_path
    rescue Exception => e
      raise e
    end
  end

end