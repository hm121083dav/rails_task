class  Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  #Админ часть.Загрузка стартовой страници
  def index
    #Получаем текущий статус для вывода заявок.
    # Проверяем или пришел параметр (get)
    @status_id = params['id'].blank? ? 1 : params['id'].to_i
    #Выбираем заявку по ее статусу который мы получили по get
    @tickets = Ticket.all.where('status_id = ?',@status_id)
    #Выбираем коллекцию массива обьектов списка статусов заявок
    @statuses = Status.all

    #Выбор в каком формате выводить вьюшку
    respond_to do |format|
      format.html
    end
  end

  #Назначение тикета сотруднику тех поддержки
  def assign_for_me_ticket
    #Выбираем заявку по уникальному названию тикета,  котое получам по get
    ticket = Ticket.find_by_ticket_name(params['id'])
    #если все успешно
    begin
      #Обновляем в модели  тикетов статус заявки на - открыта  (id=2)
      ticket.update_attributes(status_id: 2, user_id: current_user.id)
      #Редирект на admin/dashboard/index
      redirect_to admin_root_path
    #если код выполнился не успешно (исключение)
    rescue Exception => e
      raise e
    end
  end

end