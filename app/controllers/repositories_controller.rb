class RepositoriesController < ApplicationController
  

  def index
    response = Faraday.get "https://api.github.com/user" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
      end
    body = JSON.parse(response.body)
    session[:username] = body["login"]
    @user = session[:username]

    repo_response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
    end

   @repos = JSON.parse(repo_response.body)
   binding.pry
  end

end
