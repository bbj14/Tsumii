class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  before_action :set_user, except: [:index, :new, :create]
  before_action ->{
    count(@user)
  }, only: [:show, :followings, :followers, :likes]
  
  include UserActions
  
  def index
    # for amdin
    #@users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    redirect_to mypage_url if @user == current_user
    @works = @user.works.order(created_at: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def update
    if @user == current_user && @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to edit_mypage_path
    else
      flash[:danger] = "プロフィールは更新されませんでした"
      render 'mypages/edit'
    end
  end
  
  def destroy
    @user.destroy! if @user == current_user
    flash[:success] = "退会しました"
    redirect_to root_url
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :biography)
  end
end
