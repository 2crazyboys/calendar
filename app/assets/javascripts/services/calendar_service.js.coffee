app = angular.module("Scheduler")
app.factory "calendarService", () ->
    return new MonthCalendar(moment().month() + 1, moment().year())


class Day
  constructor: (@date, @format="YYYYMMDD") ->
    @_id = @date.format(@format)
    @events = []

  id: ()->
    @_id

  date: () ->
    @date.format("DD/MM/YYYY")

  addEvent: (event) ->
    @events.push(event)

  public: () ->
    id: @id()
    date: @date.format("DD/MM/YYYY")


class MonthCalendar
  constructor: (month, year) ->
    @format="YYYYMMDD"
    @current_month = moment("#{month}/#{year}", 'M/YYYY').startOf('month')
    @start_of_week = @current_month.day()
    @indexer = [] 
    @table = {}
    @build_calendar()

  build_calendar: () ->
    @build_previous [@start_of_week...0]
    @build_actual [0...moment(@current_month).endOf('month').date()]
    table_size = @lines().length * @columns().length 
    remaining = table_size - @indexer.length
    @build_forward [0...remaining]
    return
  
  build_previous: (range) ->
    for decrement in range
      day = moment(@current_month).subtract('days', decrement)
      slot = new Day(day)
      @table[slot.id()] = slot
      @indexer.push slot.id()

  build_actual: (range) ->
    for actual in range
      day = moment(@current_month).add('days',actual)
      slot = new Day(day)
      @table[slot.id()] = slot
      @indexer.push slot.id()


  build_forward: (range) ->
    next_month = moment(@current_month).add('month', 1)
    for forward in range
      day = next_month.add('days',forward)
      slot = new Day(day)
      @table[slot.id()] = slot
      @indexer.push slot.id()

  dayFrom: (line, column) ->
    id  = @indexer[@index(line, column)]
    @table[id]

  eventsFrom: (line, column) ->
    id  = @indexer[@index(line, column)]
    day = @table[id]
    return [] unless day?
    day.events

  day: (id) ->
    @table[id]

  addEvent: (event) ->
    day = moment(event.date, "YYYY-MM-DD").format(@format)
    @table[day].addEvent event

  index: (line, column) ->
    (line * @columns().length) + column

  columns:() ->
    [0..6]
  lines: () ->
    l = Math.ceil (@start_of_week + moment(@current_month).endOf('month').date()) / 7
    [0..(l-1)]
