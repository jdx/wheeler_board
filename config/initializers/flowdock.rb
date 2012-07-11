if Rails.env.production?
  FLOWDOCK = Flowdock::Flow.new(
    api_token: ENV['FLOWDOCK_TOKEN'],
    source: "wheelerboard",
    from: {name: "WheelerBoard", address: "wheelerboard@tapjoy.com"}
  )
end
