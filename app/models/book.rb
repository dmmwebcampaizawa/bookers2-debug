class Book < ApplicationRecord

  #has_one_attachedはモデルに1つの画像を添付する
  #dependent: :destroyは関連モデルも一緒に削除する
  has_one_attached :profile_image, dependent: :destroy
  #1:Nの関係
  belongs_to :user
  #バリデーション
  validates :title,presence:true
  validates :body,presence:true,length: { minimum: 1, maximum: 200 }
end
