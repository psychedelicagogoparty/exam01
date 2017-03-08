class InuttersController < ApplicationController
    
    #共通のメソッドへ定義したアクションの事前呼び出し
    before_action :set_tweet, only:[:edit, :update, :destroy] 
    
    #変数の定義のルール！：中身が複数のもの：複数系、単体のもの：単体系
    def index
        @inutters = Inutter.all
    end
    
    #新規作成
    def new
     if params[:back]
      @inutter = Inutter.new(inutters_params)
     else
      @inutter = Inutter.new
     end
    end
    
    def create
        #処理内容①　投稿内容作成
        Inutter.create(inutters_params)
        #処理内容②　リダイレクト
        redirect_to inutters_path
    end

    def confirm
        @inutter = Inutter.new(inutters_params)
        render :new if @inutter.invalid? #確認時のバリデーション
    end
    
    #編集
    def edit

    end

    def update
        if @inutter.update(inutters_params) #値を更新するためにupdateメソッドを使用(引数はblogの内容)
          redirect_to inutters_path,notice:"ブログを更新しました！"#indexアクションにリダイレクト
        else 
          render 'new' #再描画
        end
    end
    
    
    #削除    
    def destroy
        #当該のパラメータを取得
        @inutter = Inutter.find(params[:id])
        #処理内容①　ここでは削除
        @inutter.destroy
        #処理内容②　リダイレクト
        redirect_to inutters_path,notice:"投稿を削除しました！"
    end
    
    #ストロングパラメータ
    private
     def inutters_params
       params.require(:inutter).permit(:content)
     end
     
     #事前に呼び出すアクションの中身
     def set_tweet
        @inutter = Inutter.find(params[:id])
     end
end

