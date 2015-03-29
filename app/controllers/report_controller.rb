class  ReportController < ApplicationController
  #before_action :authenticate_user!

  def index

    # Передаем заговолок во вьюшку
    @Tile = 'USER - HelpDesk'


    render '/form.html.haml'

  end

  #Просмотр заявки результата решени
  def showRequest

    # Передаем заговолок во вьюшку
    @Tile = 'USER - HelpDesk (Просмотр результата решения)'



    render '/report.html.haml'

  end

end