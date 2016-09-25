class PicturesController < ApplicationController
before_action :authenticate_user!
before_action :set_picture, only: [:show,:edit, :update, :destroy]


  def index
    @pictures = Picture.all
    @pictures = Picture.order(:created_at).reverse_order
  end

  def show
  end


  def new
    if params[:back]
    @picture = Picture.new(pictures_params)
    else
    @picture = Picture.new
  end
end




  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render action: 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
     # edit, update, destroyで共通コード
    #@picture = Picture.find(params[:id])

    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "写真を無事にUpdateしました！"
    else
      render action: 'edit'
    end


    # @picture = Picture.find(params[:id])
    # @picture = Picture.update(pictures_params)
    #redirect_to pictures_path, notice: "写真を無事にUpdateしました！"
  end


  def destroy
    #@picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "写真を無事に削除しました！"
  end

  def confirm
    @picture = Picture.new(pictures_params)
    render :new if @picture.invalid?


  end


private
  def pictures_params
    params.require(:picture).permit(:title, :content)
  end

 # idをキーとして値を取得するメソッド
    def set_picture
      @picture = Picture.find(params[:id])
    end


end
