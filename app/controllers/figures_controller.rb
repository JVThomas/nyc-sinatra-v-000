require 'pry'
class FiguresController < ApplicationController
  
  get '/figures/new' do
    @landmarks = Landmark.all
    @titles = Title.all
    erb :"figures/new"
  end

  post '/figures' do 
    @new_figure = Figure.new(name: params["figure"]["name"])
    @landmark_ids = params["figure"]["landmark_ids"].map{|id| id.to_i} if !!params["figure"]["landmark_ids"]
    @title_ids = params["figure"]["title_ids"].map{|id| id.to_i} if !!params["figure"]["title_ids"]
    
    if !!@landmark_ids
      @landmark_ids.each do |id|
        @new_figure.landmarks << Landmark.find(id)
      end
    end
    
    if !!@title_ids
      @title_ids.each do |id|
        @new_figure.titles << Title.find(id)
      end
    end

    if !params["landmark"]["name"].empty?
      @new_landmark = Landmark.create(name: params["landmark"]["name"])
      @new_figure.landmarks << @new_landmark
    end

    if !params["title"]["name"].empty?
      @new_title = Title.create(name: params["title"]["name"])
      @new_figure.titles << @new_title
    end

    @new_figure.save
    redirect to "/figures/#{@new_figure.id}"  
  end
end