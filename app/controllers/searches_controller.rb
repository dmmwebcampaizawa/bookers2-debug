class SearchesController < ApplicationController
  
  #deviseのメソッド。ユーザがログインしているか確認し、ログインしていない場合はログインページにリダイレクト
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if
      @range == "User"
      @users = User.looks(params[:search], params[:word])
      @word = params[:word]
      render :search
    elsif
      @range == "Book"
      @books = Book.looks(params[:search], params[:word])
      @word = params[:word]
      render :search
    else
      render :search
    end
  end
  
end
