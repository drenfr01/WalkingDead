class AuthenticationsController < ApplicationController
  
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
	omniauth = request.env["omniauth.auth"]
        authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
 	if authentication
		flash[:notice] = "Signed in successfully"
		sign_in(:user, authentication.user)
		redirect_to "/mobile/loglocation/"
		#render :text => omniauth.to_yaml
	elsif current_user
		current_user.authentications.create(:provider => omniauth['provider'], 
		:uid => omniauth['uid'])
    		flash[:notice] = "Authentication successful" 
     		redirect_to "/mobile/loglocation/"
  	else 
		user = User.new
		user.authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
		user.email = omniauth['info']['email']
    user.first_name = omniauth['info']['first_name']
    user.last_name = omniauth['info']['last_name']
		if user.save
			flash[:notice] = "Signed in successfully"
        		sign_in_and_redirect(:user, user)
        		#render :text => omniauth.to_yaml
		else 
         session[:omniauth] = omniauth.except('extra')
          redirect_to new_user_registration_url
    end
		end

  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    redirect_to authentications_url, :notice => "Successfully destroyed authentication."
  end
end
