class LocationChallengesController < ApplicationController
  def new
  end

  def show
   @location_challenge = LocationChallenge.find(params[:id])
  end

  def edit
  end

  def delete
  end

end
