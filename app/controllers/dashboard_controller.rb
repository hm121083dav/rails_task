class DashboardController < ApplicationController

  #Загрузка стартовой страницы юзерской части
  def index
    #Создаем объект заявки (свойства равны NILL)
    @tickets = Ticket.new
    #Выбрать коллекцию  массива обьектов
    # из всех комманд тех отдела
    @teams = Team.all

    #Выбор в каком формате выводить вьюшку
    respond_to do |format|
      format.html
    end
  end

  #Добавление заявки пользователем в тех поддержку
  def tickets
    #Получить с формы (app/views/dashboard/_form.html.haml) POST данные и проверить на иньекции безопастность
    form_params = params.require(:ticket).permit(:customer_name, :customer_email, :team_id, :subject, :description)
    #Создаем обьект с данными клиента которые пришли из формы (POST)
    @tickets = Ticket.new(form_params)
    #Выбрать коллекцию  массива обьектов
    # из всех комманд тех отдела
    @teams = Team.all

    #Присваеваем заявке статус Новой заявки (id=1)
    @tickets.status_id=1
    #Создаем свойства имя уникального тикета - заявки (Короткое имя - рандом значение)
    @tickets.ticket_name="#{@teams.find(form_params['team_id'])[:short_name]}-#{SecureRandom.hex}" unless form_params['team_id'].blank?

    #Выбор в каком формате выводить вьюшку
    respond_to do |format|
      #Сохраняем статус заявки Новой заявки (id=1) и ее уникальное имя (Короткое имя - рандом значение)
      if @tickets.save
        # SupportMailer.tickets_create(@tickets).deliver_now
        # Редирект на dashboard/index
        format.html { redirect_to root_path, notice: 'Заявка была успешно сформирована.' }
      else
        #Просто отобразить вьюшку index метода index
        format.html { render action: 'index' }
      end
    end
  end

  #Просмотр заявки, состояния и журнала
  def show
    #Выбираем заявку по уникальному названию тикета (get)
    @ticket = Ticket.find_by_ticket_name(params['id'])
    #Выбираем лог (журнал записи) заявки по id тикета
    @logs = Log.all.where('ticket_id = ?', @ticket.id)
    #Выбор в каком формате выводить вьюшку
    respond_to do |format|
      format.html
    end
  end

end