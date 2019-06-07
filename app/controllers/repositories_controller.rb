class RepositoriesController < ApplicationController
  
  def index
    response = Faraday.get "https://api.github.com/user" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
   end
   body = JSON.parse(response.body)
   @user = body["login"]
   # repo_response = Faraday.get "#{body["repos_url"]}"
   repo_response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
   end
   @repos = JSON.parse(repo_response.body)
   render :index
  end

  def create

  end
end
