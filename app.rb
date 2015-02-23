# app.rb
require 'sinatra/base'
require 'sinatra/content_for'
require 'cat_api'
require 'holidapi'

class MyWebApp < Sinatra::Base
	helpers Sinatra::ContentFor
  get '/' do
		last_modified Time.now
		@thisMonthsHolidays = HolidApi.get(country: 'us', year: Time.now.year, month: Time.now.month)
		@myBirthdayHolidays = HolidApi.get(country: 'us', year: 1993, month: 2)
    erb :index
  end
	
	get '/cats' do
		@pictures = CatAPI.new.get_images(category: 'hats', results_per_page: '100')
		erb :cats
	end
end