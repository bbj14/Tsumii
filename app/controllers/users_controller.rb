class UsersController < ApplicationController
  before_action :require_user_logged_in, except: [:new, :create]
  
  include UserActions
  
  def index
    #@users = User.order(id: :desc).page(params[:page]).per(25)
  end

  def show
    set_user
    #redirect_to mypage_url if @user == curennt_user
    count(@user)
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

  def edit
    @user = current_user
  end
  
  def update
    set_user
    if @user.update(user_params)
      flash[:success] = "プロフィールを更新しました"
      redirect_to edit_user_path(@user)
    else
      flash[:danger] = "プロフィールは更新されませんでした"
      render :edit
    end
  end
  
  def destroy
    @user = 
    @user.destroy!
    #session[:user_id] = nil
    if current_user.admin
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "退会しました"
      redirect_to root_url
    end
  end
  
  private

  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :biography)
  end
end
