class ImagesController < ApplicationController
  before_action :set_s3_direct_post, only: [:create]
  
  def create
    @item = Item.find(params[:item_id])
    if( params[:image] != nil)
    @item.image.attach(params[:image])
    else
    end
    redirect_to(item_path(@item))
  end

  private
  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: '201', acl: 'public-read')
  end
end
