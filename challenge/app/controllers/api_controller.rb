class ApiController < ApplicationController
  
  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end
  
  def get_user_challenges
    @user = User.find_by_id params[:id]
    @challenges = @user.feats
    @return = {:user => @user, :challenge => @challenges}
    render :json => @return
    #render :json => @user
  end
  
  def get_challenge_list
    @challengelist = LocationChallenge.all :limit => 10
    render :json => @challengelist, :only => [:title, :description, :latitude, :longitude]

  end
  
  def get_user_challenges_xml
    @user = User.find_by_id params[:id]
    @challenges = @user.feats
    render :xml => @challenges, :only => [:complete, :updated_at]
  end
  
  def get_challenge_list_xml
     @challengelist = LocationChallenge.all :limit => 10
     render :xml => @challengelist, :only => [:title, :description, :latitude, :longitude]
   end
  
end
