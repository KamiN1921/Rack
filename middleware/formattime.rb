class FormatTime

  FORMATS = { year: '%Y',
              month: '%m',
              day: '%d',
              hour: '%H',
              minute: '%M',
              second: '%S' }.freeze

  def initialize(app)
    @app = app
  end

  def call(env)
    status, headers, body = @app.call(env)
    headers['X-Time'] = DateTime.now.strftime('%d %B %Y %k:%M:%S')
    [status, headers, body]
  end
end
