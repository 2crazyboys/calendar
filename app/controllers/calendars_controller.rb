class CalendarsController < ApplicationController
  
  def template
    render params[:type]
  end

end