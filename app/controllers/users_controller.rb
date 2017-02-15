class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  #获取所有的用户展示页面
  def index
    @users = User.paginate(page: params[:page])
  end

  #展示某个用户
  def show
    @user = User.find(params[:id])
  end

  #获取用户注册页面
  def new
    @user = User.new
  end

  #用户填写表单注册账号
  def create
    @user = User.new(user_params)
    if @user.save
      #注册即登录
      log_in @user
      #处理注册成功的情况
      flash[:success]="Welcome to the Sample App!"
      redirect_to user_url @user
    else
      render 'new'
    end
  end

  #获取用户编辑页面
  def edit
  end

  #用户编辑个人信息
  def update
    if @user.update_attributes(user_params)
      # 处理更新成功的情况
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #删除用户
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  #私有的方法，只在该类中用到
  private
    #获取用户提交的表单信息
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end

    # 事前过滤器
    # 确保用户已登录
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

    # 确保是正确的用户
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # 确保是管理员
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
