# frozen_string_literal: true

class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'/figures/index'
  end

  get '/figures/new' do
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/new'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])

    create_title(params, @figure) unless params[:title][:name].empty?
    create_landmark(params, @figure) unless params[:landmark][:name].empty?

    redirect "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    @titles = @figure.titles
    @landmarks = @figure.landmarks
    erb :'/figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    @titles = Title.all
    @landmarks = Landmark.all
    erb :'/figures/edit'
  end

  patch '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])

    create_title(params, @figure) unless params[:title][:name].empty?
    create_landmark(params, @figure) unless params[:landmark][:name].empty?

    redirect "/figures/#{@figure.id}"
  end

  delete '/figures/:id' do
    @figure = Figure.find(params[:id])
    @figure.delete
    redirect '/figures'
  end

  private

  def create_title(params, figure)
    figure.titles << Title.create(params[:title])
  end

  def create_landmark(params, figure)
    figure.landmarks << Landmark.create(params[:landmark])
  end
end
