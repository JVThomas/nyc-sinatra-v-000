require 'pry'
class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    @new_landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    redirect to "/landmarks/#{@new_landmark.id}"
  end

  get "/landmarks" do
    @landmarks = Landmark.all
    erb :"landmarks/index"
  end

  get "/landmarks/:id" do 
    @landmark = Landmark.find(params[:id])
    erb :"landmarks/show"
  end

end
