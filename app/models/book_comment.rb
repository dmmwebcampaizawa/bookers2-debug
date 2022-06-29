class BookComment < ApplicationRecord
  #1:Nの関係
  belongs_to :user
  belongs_to :book
  
end
