class DashboardController < ApplicationController

  #Загрузка стартовой страницы юзерской части
  def index
    @tickets = Ticket.new
    @teams = Team.all

    respond_to do |format|
      format.html
    end
  end



end