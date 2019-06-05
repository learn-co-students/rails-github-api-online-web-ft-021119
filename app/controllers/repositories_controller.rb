class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['oauth_token'] = session[:token]
    end
    @username = JSON.parse(resp.body)["login"]

    resp2 = Faraday.get("https://api.github.com/users/#{@username}/repos")
    @repos = JSON.parse(resp2.body)
  end

  def create
    resp = Faraday.post("https://api.github.com/user/repos") do |req|
      req.params['oauth_token'] = session[:token]
    end
    byebug
     Repository.create(name: JSON.parse(resp.body)["name"])
  end

end
