class EventsController < ApplicationController
  respond_to :json

  #GET /events
  def index
    render json: Event.all
  end

  #GET /events/DDMMYYY
  def date
    date =  Date.strptime(params[:date],"%Y-%m-%d")
    render json: Event.where(date: date)
  end

  # GET /events/from/:from/to/:to
  def between
    from  =  Date.strptime(params[:from], "%Y-%m-%d")
    to    =  Date.strptime(params[:to],   "%Y-%m-%d")
    events = Event.between from, to
    render json: events
  end

  def from
    from  =  Date.strptime(params[:from], "%Y-%m-%d")
    events = Event.gte from
    render json: events
  end

  def to
    to  =  Date.strptime(params[:to], "%Y-%m-%d")
    events = Event.lte to
    render json: events
  end

  #PUT /events/:id
  def update
    event = Event.find params[:id]
    event.upate_attributes param[:event]
    render json: event
  end

  #DELETE /events/:id
  def delete
    Event.find(params[:id])
    event.destroy
    head 200
  end

end
