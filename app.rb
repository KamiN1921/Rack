class App

  def call(env)
    request = Rack::Request.new(env)

    if request.get? && request.path == '/time'
      formatted_time(request)
    else
      response(["Page not found (404)"], 404, { 'Content-Type' => 'text/plain' })
    end
  end

  private

  def formatted_time(request)
    formatted = FormatTime.new(request.params['format'])
    formatted.call

    if formatted.valid?
      response(['200 ok formatted.formatted'], 200, { 'X-Time' => formatted.formatted })
    else
      response(["Unknown format #{formatted.errors.join}"], 400, { 'X-Time' => 'Bad format' })
    end
  end

  def response(body, status, headers)
    Rack::Response.new(body, status, headers).finish
  end

end
