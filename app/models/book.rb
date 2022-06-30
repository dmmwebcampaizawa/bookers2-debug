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

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

  #バリデーション
  validates :title,presence:true
  validates :body,presence:true,length: { minimum: 1, maximum: 200 }
end
