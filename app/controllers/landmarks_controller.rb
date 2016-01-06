class LandmarksController < ApplicationController
  get '/landmarks/new' do
    erb :"landmarks/new"
  end

  post "/landmarks" do
    @new_landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year_completed"])
    redirect to "/landmarks/:id"
  end

  get "/landmarks" do
    @landmarks = Landmarks.all
    erb :"landmarks/index"
  end

end
