require './config/application'
require 'rack/google-analytics'
require 'json'

app = BestQuotes::Application.new

app.route do
  match "", "quotes#index"
  match "sub-app", proc {
    [
      200,
      {},
      ["Hello, sub-app!"]
    ]
  }

  # default routes
  match ":controller/:id/:action"
  match ":controller/:id", :default => { "action" => "show" }
  match ":controller", :default => { "acion" => "index" }
end

run app
