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

end
post '/selection' do
	
    session[:meatsy]= params[:meat_radio]
 	session[:cheesety] = params[:cheese_radio]
 	session[:saucety] = params[:sauce_radio]
 	session[:veggetty] = params[:veg_radio]

    redirect'/results'
end  
get '/results' do
	
erb :results, locals: {sv: session[:saucety], mv: session[:meatsy], cv: session[:cheesety], vv: session[:veggetty]}
end
