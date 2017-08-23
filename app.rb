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
 puts" POST INDEX #{meats} #{cheese} #{sauce} #{veggies}"
end
 	
get '/selection' do
	
puts " GET SELECTION #{meats} #{cheese} #{sauce} #{veggies}"
  	erb :selection, locals:{cheese: session[:cheesetype], meats:session[:meatstype], sauce: sessions[:saucetype], veggies: sessions[:veggies]}
end


post '/selection' do
	puts'MADE IT TO POST SELECTION'
  	meats = params[:meats]
 	cheese = params[:cheese]
 	sauce = params[:sauce]
 	veggies = params[:veggies]
 	puts "meats = #{meats}, cheese = #{cheese} sauce = #{sauce} veggies = #{veggies}"
    # toppings = params[:toppings]
    # redirect'/results'
end  
# get '/results' do
#  	toppings = params[:toppings].split(',')
# 	erb :results, :locals=>{  toppings: toppings}
# end	


	