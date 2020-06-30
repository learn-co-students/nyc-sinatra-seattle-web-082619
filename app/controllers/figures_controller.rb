class FiguresController < ApplicationController


get '/figures' do  
  erb :'/figures/index'
end 

get '/figures/new' do 
  erb :'/figures/new'
end 

post '/figures' do 
@figure = Figure.create(params)
redirect to "/figures/#{@figure.id}"
end 

get '/figures/:id' do 
  @figure = Figure.find(params[:id])
  erb :'/figures/show'
end 






end
