class Admin::TicketsController < ApplicationController

  #Вывести заявку и ее текущее состояние
  def work_and_progress_ticket
    @ticket = Ticket.find_by_ticket_name(params['id'])
    @status = Status.all
    @users = User.all
    @logs = Log.all.where('ticket_id = ?', @ticket.id)
  end

  #Изменить параметры тикета (статус и/или кому назначен)
  def reassign_ticket
    ticket_params = params.require(:reassign_ticket).permit(:solution_description, :status_id, :user_id)
    @ticket = Ticket.find_by_id(params[:ticket_id])
    begin
      @ticket.update_attributes(status_id: ticket_params['status_id'], user_id: ticket_params['user_id'])
      @log = Log.new
      @log.ticket_id= params[:ticket_id]
      @log.status_id= ticket_params['status_id']
      @log.assigned_id= ticket_params['user_id']
      @log.committer_id= params[:committer_id]
      @log.solution_description= ticket_params['solution_description']
      @log.save
      #SupportMailer.change(@ticket).deliver_now if @log.save
      redirect_to admin_root_path + '/' + ticket_params['status_id']
    rescue Exception => e
      raise e
    end
  end

  def find_ticket
    @srch = params.require(:find_ticket)[:search]
    # render text: "#{srch}"
    # @tickets = Ticket.where("ticket_name like :name or subject like :subject", {:name => srch, :subject => srch})
    @tickets = Ticket.where("ticket_name LIKE :a OR subject LIKE :b", {:a => @srch, :b => @srch})
    @status = Status.all
    @users = User.all
  end

  #Взять в заявку в работу
  def start_working_ticket
    ticket = Ticket.find_by_ticket_name(params['id'])
    begin
      ticket.update_attributes(status_id: 3, user_id: current_user.id)
      redirect_to admin_root_path
    rescue Exception => e
      raise e
    end
  end

  #Закрвытие заявки
  def finished_ticket
    ticket = Ticket.find_by_ticket_name(params['id'])
    begin
      ticket.update_attributes(status_id: 4, user_id: current_user.id)
      redirect_to admin_root_path
    rescue Exception => e
      raise e
    end
  end

end