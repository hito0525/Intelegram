class PicturesController < ApplicationController
  def index
    @pictures = Picture.all
  end

  def new

    @picture = Picture.new
  end

  def create
    #Picture.create(pictures_params)
    @picture = Picture.new(pictures_params)
    if @picture.save
    #覧画面へ遷移して"写真投稿無事に完了しました！"とメッセージを表示します。
    redirect_to pictures_path, notice: "写真投稿無事に完了しました！"
    else
    #上記登録できなかったら、入力フォームに再び戻る
    render action: 'new'
    end
  end

  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture = Picture.update(pictures_params)
    redirect_to pictures_path
  end



  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "写真を無事に削除しました！"
  end

private
  def pictures_params
    params.require(:picture).permit(:title, :content)
  end

end
