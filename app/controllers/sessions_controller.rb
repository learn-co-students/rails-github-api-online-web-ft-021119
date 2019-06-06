class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def create
 
		response = Faraday.post "https://github.com/login/oauth/access_token" do |req|
		  req.body = { 'client_id': '9d74b829f31d0b5b42e0', 'client_secret': '57fd84fe89308ab5d06a9b1d7f8309d9a3cf048d', 'code': params[:code] }
		  req.headers['Accept'] = 'application/json'
		end
		body = JSON.parse(response.body)
		 session[:token] = body['access_token']
	
		
	redirect_to root_path

  end
end
