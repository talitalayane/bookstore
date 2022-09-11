class Admin::UsersController < AdminController
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    @users = User.order(id: :desc)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    if @user.save
      redirect_to user_users_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    params = form_params.to_h
    params = params.except!(:password, :password_confirmation) if params[:password].blank?

    if @user.update(params)
      redirect_to user_users_path
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to user_users_path
  end

  private

  def form_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
