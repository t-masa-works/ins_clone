class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)

    if @picture.save
      redirect_to picture_path(@picture), notice: "保存に成功しました"
    else
      render :new
    end
  end

  def edit
    set_picture
  end

  def update
    @picture.update(picture_params)
  end

  def show
    set_picture
  end

  def destroy
    set_picture
    @picture.destroy
    redirect_to pictures_path
  end

  private

  def set_picture
    @picture = Picture.find(params[:id])
  end

  def picture_params
    params.require(:picture).permit(:image, :content, :image_cache)
  end
end