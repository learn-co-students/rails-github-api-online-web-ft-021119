class RepositoriesController < ApplicationController
  
  def index
  	@repositories = getRepo
   @user = getUser
  end




  def getRepo
   response = Faraday.get "https://api.github.com/user/repos" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
   end
   repos = JSON.parse(response.body)

	end
	def getUser
	response = Faraday.get "https://api.github.com/user" do |req|
      req.headers = {"authorization": "token #{session[:token]}"}
   end
   body = JSON.parse(response.body)
   @user = body["login"]

     end
   
end
