class  ReportController < ApplicationController
  before_action :authenticate_user!

  def index
    #puts 'Report Work!'

    #render text: 'Report Work_2';

    render 'report';

  end
end