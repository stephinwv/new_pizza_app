require "sinatra"
enable :sessions

get '/' do
	erb :index
end
post '/index' do
	puts "MADE IT TO POST INDEX"
  	session[:meatstype]= params[:meats]
 	session[:cheesetype] = params[:cheese]
 	session[:saucetype] = params[:sauce]
 	session[:veggietype] = params[:veggies]
 	redirect '/selection' 
end
 	
get '/selection' do
	erb :selection, locals: {meats: session[:meatstype], cheese: session[:cheesetype], sauce: session[:saucetype], veggies: session[:veggietype]} 	
	# puts "meats = #{meats}, cheese = #{cheese} sauce = #{sauce} veggies = #{veggies}"
end
post '/selection' do
	
    session[:meatstype]= params[:meats]
 	session[:cheesetype] = params[:cheese]
 	session[:saucetype] = params[:sauce]
 	session[:veggietype] = params[:veggies]
 	session[:toptops] = params[:toppings]
 	
    puts'MADE IT TO POST SELECTION #{meats} #{cheese} #{sauce} #{veggies}' 	
    

    redirect'/results'
end  
get '/results' do
	session[:toptops] = params[:toppings]	
end
