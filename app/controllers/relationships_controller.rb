class RelationshipsController < ApplicationController
  before_action :logged_in_user
  before_action :find_user, except: [:create, :destroy]

  def index
    type = params[:type]
    @title = t "#{type}"
    @users = @user.send(type).paginate page: params[:page]
    render "users/show_follow"
  end

  def create
    @user = User.find_by id: params[:relationship][:followed_id]
    current_user.follow @user
    @unfollow = current_user.active_relationships.find_by followed_id: @user.id
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  def destroy
    @user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow @user
    @follow = current_user.active_relationships.build
    respond_to do |format|
      format.html{redirect_to @user}
      format.js
    end
  end

  private

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".error"
    redirect_to root_path
  end
end
