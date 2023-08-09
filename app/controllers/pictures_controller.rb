class PicturesController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  skip_before_action :login_owner, only: [:edit]
  
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      PictMailer.contact_mail(@picture).deliver
      redirect_to picture_path(@picture), notice: "保存に成功しました"
    else
      render :new
    end
  end

  def edit
    set_picture
  end

  def update
    set_picture
    @picture.update(picture_params)
    render :edit
  end

  def show
    set_picture
    @favorite = current_user.favorites.find_by(picture_id: @picture.id)
  end

  def destroy
    set_picture
    @picture.destroy
    redirect_to pictures_path, notice: "画像の削除に成功しました"
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :content, :image_cache)
  end
end
