class RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    flash.now[:notice] = 'フォローしました'

    # renderを使用するためuserのshowページに必要なデータを記述
    @user = User.find(params[:user_id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    # ここまで
    render :relationship  #jsファイルを指定
  end

  def destroy
    current_user.unfollow(params[:user_id])
    flash.now[:alert] = 'フォローを外しました'

    # renderを使用するためuserのshowページに必要なデータを記述
    @user = User.find(params[:user_id])
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    # ここまで
    render :relationship  #jsファイルを指定
  end

end
