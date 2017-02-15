class PasswordResetsController < ApplicationController
  #因为在 edit 和 update 动作中都要使用 @user ,所以我们要把查找用户和认证令牌的代码写入一个事前过滤器中
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  #检查重设密码是否超时
  before_action :check_expiration, only: [:edit, :update]

  def new
  end

  #通过电子邮件地址查找用户,更新这个用户的 reset_token 、 reset_digest 和 reset_sent_at 属性,然后重定向到根地址,并显示一个闪现消息。
  #如果提 交的数据无效,我们要重新渲染这个页面,并且显示一个 flash.now 消息。
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.create_reset_digest
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash.now[:danger] = "Email address not found"
      render "new"
    end
  end

  def edit
  end

  def update
    if password_blank?
      flash.now[:danger] = "Password can't be blank"
      render 'edit'
    elsif @user.update_attributes(user_params)
      log_in @user
      flash[:success] = "Password has been reset."
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    # 如果密码为空,返回 true
    def password_blank?
      params[:user][:password].blank?
    end

    #根据email获取用户信息
    def get_user
      @user = User.find_by(email: params[:email])
    end

    # 确保是有效用户
    def valid_user
      unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
        redirect_to root_url
      end
    end

    # 检查重设令牌是否过期
    def check_expiration
      if @user.password_reset_expired?
        flash[:danger] = "Password reset has expired."
        redirect_to new_password_reset_url
      end
    end
end
