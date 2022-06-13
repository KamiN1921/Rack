class App

  def call(env)
    request = Rack::Request.new(env)

    if request.get? && request.path == '/time'

    else
      response(["Page not found (404)"],404, { 'Content-Type' => 'text/plain' })
    end
  end

  private

  def response(body, status, headers)
    Rack::Response.new(body, status, headers).finish
  end

end
