class LandmarksController < ApplicationController
  get '/landmarks' do
    @landmarks = Landmark.all
    erb :'/landmarks/index'
  end

  get '/landmarks/new' do
    @figures = Figure.all
    erb :'/landmarks/new'
  end

  post '/landmarks' do
    @landmark = Landmark.create(params)
    redirect "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :'/landmarks/show'
  end

  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    @figures = Figure.all
    erb :'/landmarks/edit'
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(figure_id: params[:figure_id],
                     name: params[:name],
                     year_completed: params[:year_completed])

    unless params[:figure][:name].empty?
      @figure = Figure.create(params[:figure])
      @figure.landmarks << @landmark
      @landmark.update(figure: @figure)
    end
    redirect "/landmarks/#{@landmark.id}"
  end

  delete '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.delete
    redirect '/landmarks'
  end

end
