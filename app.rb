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
	
    session[:meatstype]= params[:mv]
 	session[:cheesetype] = params[:cv]
 	session[:saucetype] = params[:sv]
 	session[:veggietype] = params[:vv]

    redirect'/results'
end  
get '/results' do
	
erb :results, locals:{sv: session[:saucetype], mv: session[:meatstype], cv: session[:cheesetype], vv: session[:veggietype]}
end
