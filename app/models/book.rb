class Book < ApplicationRecord

  #has_one_attachedはモデルに1つの画像を添付する
  #dependent: :destroyは関連モデルも一緒に削除する
  has_one_attached :profile_image, dependent: :destroy
  #1:Nの関係
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  #バリデーション
  validates :title,presence:true
  validates :body,presence:true,length: { minimum: 1, maximum: 200 }
end
