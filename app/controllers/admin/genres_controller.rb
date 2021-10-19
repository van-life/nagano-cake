class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "作成完了"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンル名を入力してください"
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      flash[:notice] = "作成完了"
      redirect_to admin_genres_path
    else
      flash.now[:alert] = "ジャンル名を入力してください"
      render :edit
    end
  end


  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
