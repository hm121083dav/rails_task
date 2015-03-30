class  Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  #Заявки не в работе
  def index

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Заявки не в работе)'

    #Получить заявки не в работе
    #@allTickets = Ticket.where(user_id: nil)
     @allTickets =  Ticket
                     .joins('LEFT OUTER JOIN status ON status.id = tickets.status_id')
                     .where(user_id: nil)
                     .select('tickets.id, tickets.subject, status.title')

    render '/admin/admin.html.haml'

  end

  #Просмотреть все заявки
  def showAllTickets
    #Получить все заявки
    @allTickets = Ticket.all
  end

  #Просмотр заявок в работе
  def showInWorkTickets

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Мои заявки в работе)'

    render '/admin/admin.html.haml'

  end

  #Просмотр заявки
  def showCurTicket(curTicket)

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Просмотр текущей заявки)'


    render '/admviewticket.html.haml'

  end

  #Взять в работу
  def openRequest
    render text: 'Взять в работу'
  end

  #Закрыть заявку
  def closedRequest
    render text: 'Закрыть заявку'
  end


  #Открепить заявку
  def untakeRequest
    render text: 'Открепить заявку'
  end


end
