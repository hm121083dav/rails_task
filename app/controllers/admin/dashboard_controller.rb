class  Admin::DashboardController < ApplicationController
  before_action :authenticate_user!

  #Админ часть.Загрузка стартовой страници
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html
    end
  end



end