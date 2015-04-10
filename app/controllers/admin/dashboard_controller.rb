class  Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  #Админ часть.Загрузка стартовой страници
  def index
    status_id = params['id'].blank? ? 1 : params['id'].to_i
    @tickets = Ticket.all.where('status_id = ?',status_id)
    @statuses = Status.all
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