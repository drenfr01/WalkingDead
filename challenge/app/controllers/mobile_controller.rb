class MobileController < ApplicationController
  
  def index
  
  	@title = 'Login'
  
  end
  
  def login
  end
  
  def loglocation
    @title = "User Location"
    render :layout => 'layouts/maplayout.html.erb'
  end

end
