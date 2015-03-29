class  Admin::AdminController < ApplicationController
  before_action :authenticate_user!

  #Меню заявок
  def index

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Все заявки)'

    @allRequests = Ticket.all

    render '/admin/admin.html.haml'

  end

  #Просмотр заявок в работе
  def showInWorkRequests

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Мои заявки в работе)'



    render '/admin/admin.html.haml'

  end

  #Просмотр заявки
  def showRequest

    # Передаем заговолок во вьюшку
    @Tile = 'ADMIN - HelpDesk (Просмотр текущей заявки)'



    render '/admin.html.haml'

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
