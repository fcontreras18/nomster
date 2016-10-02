class PhotosController < ApplicationController
  before_action :authenticate_user!

  def create
    @place = Place.find(params[:place_id]) 
    @photo = @place.photos.build(photo_params)

    if @photo.save
    # @place.photos.create(photo_params)
     redirect_to place_path(@place)
    end
  end

private

  def photo_params
    params.require(:photo).permit(:caption, :picture, :user_id, :place_id)
  end
end