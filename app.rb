# app.rb
require 'sinatra/base'
require 'sinatra/content_for'
require 'cat_api'
require 'holidapi'

class MyWebApp < Sinatra::Base
  helpers Sinatra::ContentFor
  get '/' do
    last_modified Time.now
    @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    if params['country'] != nil and params['year'] != nil and params['month'] != nil
      @holidays = HolidApi.get(country: params['country'], year: params['year'].to_i, month: params['month'].to_i)
    else
      @holidays = []
    end
    erb :index
  end
end