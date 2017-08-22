require "sinatra"
enable :sessions
get '/' do
	erb :index
end
post '/index' do
  	session[:meats] = params[:meats]
 	session[:cheese] = params[:cheese]
 	session[:sauce] = params[:sauce]
 	session[:veggies] = params[:veggies]
 	redirect '/selection'
end
 	
get '/selection' do

  	erb :selection, :locals=>{cheese: cheese, meats: meats, sauce: sauce, veggies: veggies}
end

post '/selection' do
  	session[:meats] = params[:meats]
 	session[:cheese] = params[:cheese]
 	session[:sauce] = params[:sauce]
 	session[:veggies] = params[:veggies]
    session[:toppings] = params[:toppings]
    redirect'/results' 
end  
get '/results' do
	session[:meats] = params[:meats]
 	session[:cheese] = params[:cheese]
 	session[:sauce] = params[:sauce]
 	session[:veggies] = params[:veggies]
    session[:toppings] = params[:toppings]
	erb :results
end	


	