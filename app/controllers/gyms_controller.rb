class GymsController < ApplicationController
  include HTTParty

  def search
    render :index
  end

  def google
    formatted_address = params[:gym][:formatted_address]
		google = ENV["GOOGLE"]
    response = HTTParty.get('https://maps.googleapis.com/maps/api/place/textsearch/json?query=gyms+in+'+formatted_address+'&radius=2000&key='+google+'')
		@gyms = response["results"]
		render :index
  end

  def new
  
  end

  def create
    @fav = Gym.new(gym_params)
    @fav.user_id = current_user.id
      if @fav.valid?
        @fav.save()
        redirect_to "/users/:id"
      else
        redirect_to new_gym_path
    end
  end

  def destroy
  @fav = Favejob.find(params[:gym_id]).destroy
  redirect_to "/users/:id"
 end



  private

  def gym_params
    params.require(:gym).permit(:formatted_address, :name, :geometry, :rating, :user)
  end

end
