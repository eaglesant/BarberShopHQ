#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:barbershop.db"

before do
	@barbers = Barber.all
	@clients = Client.all

end

class Client < ActiveRecord::Base
	
end

class Barber < ActiveRecord::Base
	
end

get '/' do
	erb :index			
end

get '/visit' do
  erb :visit
end

post '/visit' do
	@user_name = params[:user_name]
	@user_phone = params[:user_phone]
	@date_time = params[:date_time]
	@barber = params[:barber]
	@color = params[:colorpicker]

	c = Client.new :name => @user_name, :phone => @user_phone, :datestamp => @date_time, :barber => @barber, :color => @color

  	c.save

erb "<h2>Fank's you are enroied!!!</h2>"

end
get '/users' do
  erb :users
end