class FavoritegymsController < ApplicationController
  include HTTParty

  def search
    render :index
    def search_params
      params.require(:favoritegym).permit(:formatted_address)
    end
  end

  def show
  end

  def google
    @formatted_address = params[:gym][:formatted_address]
		@google = ENV["GOOGLE"]
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=gyms+in+#{@formatted_address}&radius=2000&key=#{@google}")
		@response = response["results"]
		render :index
  end

  def new
   @gym = Favoritegym.new
   @name = params[:gym][:name]
   @address = params[:gym][:formatted_address]
   @location = params[:gym][:geometry]
   @rating = params[:gym][:rating]
  end

  def create
    @gym = Favoritegym.new(gym_params)
    @gym.user_id = current_user.id
      if @gym.valid?
        @gym.save()
        redirect_to "/users/:id"
      else
        redirect_to new_gym_path
    end
  end

  def destroy
  @gym = Favoritegym.find(params[:gym_id]).destroy
  redirect_to "/users/:id"
 end



  private

  def gym_params
    params.require(:gym).permit(:formatted_address, :name, :geometry, :rating, :user_id)
  end

end
