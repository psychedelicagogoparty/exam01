class Inutter < ActiveRecord::Base
    #ツイート内容のバリデーションの設定(空白禁止、1〜140文字限定)
    validates :content ,length: { in: 1..140 }  ,presence:true
end
