require './config/application'
require 'rack/google-analytics'
require 'json'

app = BestQuotes::Application.new

app.route do
  root "quotes#index"
  match "sub-app", proc {
    [
      200,
      {},
      ["Hello, sub-app!"]
    ]
  }

  match ":controller/:id/:action"
  match ":controller/:id", :default => { "action" => "show" }
end

run app
