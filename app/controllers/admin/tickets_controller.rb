class Admin::TicketsController < ApplicationController

  #Вывести заявку и ее текущее состояние
  def work_and_progress_ticket
    #Выбираем заявку по уникальному названию тикета,  которое получам по get
    @ticket = Ticket.find_by_ticket_name(params['id'])
    #Выбираем коллекцию массива обьектов списка статусов заявок
    @status = Status.all
    #Выбираем коллекцию массива обьектов списка технических работников
    @users = User.all
    #Выбрать Лог (журнал заявок) по id заявки
    @logs = Log.all.where('ticket_id = ?', @ticket.id)
  end

  #Изменить параметры тикета (статус и/или кому назначен)
  def reassign_ticket
    #Получить данные с формы (views/admin/tickets/_form.html.haml), проверка на безопасность (иньекции)
    ticket_params = params.require(:reassign_ticket).permit(:solution_description, :status_id, :user_id)
    #Выбираем заявку по уникальному id тикета
    ticket = Ticket.find_by_id(params[:ticket_id])
    #если все успешно
    begin
     #Оновляем свойства тикета (Статус заявки, специалиста), сохраняем в БД
      ticket.update_attributes(status_id: ticket_params['status_id'], user_id: ticket_params['user_id'])

      #Проверяем не были ли переданы те же параметры, которые уже есть  у тикета
      #Для этого сравниваем передаваемые с формы параметры с параметрами последней записи журнала для этого тикета
      p '================>'
      p last_log_line = Log.where('ticket_id = ?',params[:ticket_id]).last
      p '================>'
      # last_log_line = last_log_line.where('status_id = ?',params[:status_id])
      # last_log_line = last_log_line.where('assigned_id = ?',params[:user_id])
      # last_log_line = last_log_line.order('id DESC','id').last
      if last_log_line.blank? or (last_log_line.status_id != ticket_params['status_id'] or last_log_line.assigned_id != ticket_params['user_id'])
        #Создаем обьект Лог (журнала), Привсваевамем свойствам из формы и сохраняем.(запись в лог)
        log = Log.new
        log.ticket_id= params[:ticket_id]
        log.status_id= ticket_params['status_id']
        log.assigned_id= ticket_params['user_id']
        log.committer_id= params[:committer_id]
        log.solution_description= ticket_params['solution_description']
        if log.save
          if log.solution_description.blank?
            SupportMailer.change(ticket).deliver_now
          else
            SupportMailer.writetouser(ticket, log).deliver_now
          end
        end
      end
      #если код выполнился не успешно (исключение)
      redirect_to admin_root_path + '/' + ticket_params['status_id']
    #если код выполнился не успешно (исключение)
    rescue Exception => e
      raise e
    end
  end

  #Поиск заявки по ее уникальному имени или теме
  def find_ticket
    #С формы получаем неазвание тикета или тему
    srch = params.require(:find_ticket)[:search]
    # render text: "#{srch}"
    # @tickets = Ticket.where("ticket_name like :name or subject like :subject", {:name => srch, :subject => srch})
    #Находим тикет по его названию или темы
    @tickets = Ticket.where("ticket_name LIKE :a OR subject LIKE :b", {:a => srch, :b => srch})
    #Выбираем коллекцию массива обьектов списка статусов заявок
    @status = Status.all
    #Выбираем коллекцию массива обьектов списка технических работников
    @users = User.all
  end

  #Взять в заявку в работу
  def start_working_ticket
    #Выбираем заявку по уникальному имени тикета (get)
    ticket = Ticket.find_by_ticket_name(params['id'])
    #если все успешно
    begin
      #Обновляем в модели  тикетов статус заявки на - (id=3)  и специалиста
      ticket.update_attributes(status_id: 3, user_id: current_user.id)
      #редирект на admin/dashboard/index
      redirect_to admin_root_path
    #если код выполнился не успешно (исключение)
    rescue Exception => e
      raise e
    end
  end

  #Закрвытие заявки
  def finished_ticket
    #Выбираем заявку по уникальному имени тикета (get)
    ticket = Ticket.find_by_ticket_name(params['id'])
    #если все успешно
    begin
      #Обновляем в модели  тикетов статус заявки на - (id=4)  и специалиста
      ticket.update_attributes(status_id: 4, user_id: current_user.id)
      #редирект на admin/dashboard/index
      redirect_to admin_root_path
    #если код выполнился не успешно (исключение)
    rescue Exception => e
      raise e
    end
  end

end