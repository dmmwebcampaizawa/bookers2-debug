class Relationship < ApplicationRecord
  
  #モデルにひとつの画像を添付する
  has_one_attached :profile_image
  
  # class_name: "User"でUserモデルを参照。フォローした、されたの関係。
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  
end
