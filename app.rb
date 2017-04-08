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

	c = Client.new params[:client]
  	c.save

erb "<h2>Fank's you are enroied!!!</h2>"

end
get '/users' do
  erb :users
end