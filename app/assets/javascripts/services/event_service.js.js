// Generated by CoffeeScript 1.4.0
var app;

app = angular.module("Scheduler");

app.factory("eventService", function($resource) {
  var RestService;
  RestService = (function() {

    function RestService() {
      this.resource = $resource("/events/:id/:date_path/:date/:from_path/:from/:to_path/:to", {
        id: "@id"
      }, {
        update: {
          method: "PUT"
        }
      }, {
        between: {
          method: "GET",
          isArray: true,
          params: {
            from_path: "from",
            to_path: "to",
            from: "@from",
            to: "@to"
          }
        }
      }, {
        from: {
          method: "GET",
          isArray: true,
          params: {
            from_path: "from",
            from: "@from"
          }
        }
      }, {
        to: {
          method: "GET",
          isArray: true,
          params: {
            to_path: "to",
            to: "@to"
          }
        }
      }, {
        by_date: {
          method: "GET",
          isArray: true,
          params: {
            date_path: "date",
            date: "@date"
          }
        }
      });
    }

    RestService.prototype.list = function(callback) {
      return this.resource.query(callback);
    };

    RestService.prototype.save = function(event) {
      return this.resource.save(event);
    };

    RestService.prototype.update = function(event) {
      return this.resource.update(event);
    };

    RestService.prototype.between = function(from, to) {
      return this.resource.between({
        from: from,
        to: to
      });
    };

    return RestService;

  })();
  return new RestService;
});