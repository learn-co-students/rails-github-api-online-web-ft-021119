class RepositoriesController < ApplicationController

  def index
    response = Faraday.get "https://api.github.com/user" do |req|
       req.headers = {"authorization": "token #{session[:token]}"}
    end
    body = JSON.parse(response.body)
    @username = body["login"]

    repo_response = Faraday.get "https://api.github.com/user/repos" do |req|
       req.headers = {"authorization": "token #{session[:token]}"}
    end
    @repos = JSON.parse(repo_response.body)
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.params['oauth_token'] = session[:token]
    end
     Repository.create(name: params[:name])
     redirect_to root_path
     
  end

end
