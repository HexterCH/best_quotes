require './config/application'
require 'rack/google-analytics'
require 'json'

map "/" do
  run QuotesController.action(:index)
end

run BestQuotes::Application.new
