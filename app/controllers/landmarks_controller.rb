class LandmarksController < ApplicationController

  get '/landmarks' do 
    erb :'/landmarks/index'
  end 

  get '/landmarks/new' do 
    erb :'/landmarks/new'
  end 
  
  post '/landmarks' do 
    @landmark = Landmark.create(params)
    redirect to "/landmarks/#{@landmarks.id}"
  end 
  
  get '/landmarks/:id' do 
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end 
  
  




end
