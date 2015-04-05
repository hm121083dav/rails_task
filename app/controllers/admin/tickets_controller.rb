class Admin::TicketsController < ApplicationController

  #Вывести все заявки и их текущее состояние
  def work_and_progress_ticket
    @ticket = Ticket.find_by_ticket_name(params['id'])
    @status = Status.all
  end

  #Прееназначить заявку другому сотруднику
  def reassign_ticket

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

  end

  #Архив заявок
  def show_history_ticket

  end

  #Послать электронное сообщение пользователю
  def send_question_to_requester

  end
end