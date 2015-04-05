class Admin::LogsController < ApplicationController

  #Добавление записи в журнал
  def create
    @logs = Log.new(log_params)
    @ticket = Ticket.find(params['logs'][:ticket_id])
    respond_to do |format|
      if @logs.save
        SupportMailer.change(@ticket).deliver_now
        @ticket.update_attributes(status_id: params['logs']['status_id']) if params['logs']['status_id'] != @ticket.status_id
        format.html { redirect_to admin_work_and_progress_ticket_path(@ticket.ticket_name), notice: 'Tickets update.' }
      else
        format.html { redirect_to admin_work_and_progress_ticket_path(@ticket.ticket_name), notice: 'Have some error' }
      end
    end
  end

  private

  #Обработчик параметров с формы для записи в журнал
  def log_params
    params.require(:logs).permit(:id, :solution_description, :ticket_id, :status_id, :committer_id)
  end

end