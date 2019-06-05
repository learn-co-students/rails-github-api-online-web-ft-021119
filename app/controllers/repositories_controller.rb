class RepositoriesController < ApplicationController

  def index
    loginresponse = Faraday.get("https://api.github.com/user") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
    end

    @login = JSON.parse(loginresponse.body)["login"]


    resp = Faraday.get("https://api.github.com/user/repos") do |req|
      req.headers['Authorization'] = "token #{session[:token]}"
    end
    @results = JSON.parse(resp.body)
    #@login = @results[0]["owner"]["login"]

  end
end
