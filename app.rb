require "sinatra"
enable :sessions

get '/' do
	erb :index
end
post '/index' do
	puts "MADE IT TO POST INDEX"
	session[:size] = params[:size]
	session[:crust] = params[:crust]
  	session[:meatstype]= params[:meats]
 	session[:cheesetype] = params[:cheese]
 	session[:sauce] = params[:sauce]
 	session[:veggies] = params[:veggies]
 	redirect '/selection' 
end
 	
get '/selection' do
	session[:total]= params[:total]
	confirmed = params[:confirmed]
	erb :selection, locals: {total: session[:totoal], size: session[:size], crust: session[:crust], meats: session[:meatstype], cheese: session[:cheesetype], sauce: session[:sauce], veggies: session[:veggies], confirmed:confirmed} 	

end
post '/selection' do
	session[:confirmed] = params[:confirmed]
	puts "THIS IS CONFIRMED"
	puts session[:confirmed]
	session[:total]= params[:total]
	session[:lastname] = params[:lastname]
	session[:delivery] = params[:delivery]
	session[:street] = params[:street]        
	session[:city] = params[:city]
	puts " #{session[:confirmed] }"
    redirect'/results'
end  
get '/results' do

	
erb :results, locals: {total: session[:total], confirmed: session[:confirmed], delivery: session[:delivery], lastname:session[:lastname], street:session[:street], city: session[:city]}

end
post '/results' do
session[:confirmed] = params[:confirmed]
	puts "THIS IS CONFIRMED"
	puts session[:confirmed]
	session[:total]= params[:total]
	session[:lastname] = params[:lastname]
	session[:delivery] = params[:delivery]
	session[:street] = params[:street]        
	session[:city] = params[:city]
	puts " #{session[:confirmed] }"
    redirect'/index'
end  
get '/index' do
	erb :index
end
