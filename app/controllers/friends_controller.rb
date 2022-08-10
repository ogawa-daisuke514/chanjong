class FriendsController < ApplicationController
  before_action :authenticate_user!
  def index
    @requests = current_user.request_friends.map{|f| f.target_user }
    @targets = current_user.target_friends.map{|f| f.request_user }
    @friends = @requests & @targets
    @requests -= @friends
    @targets -= @friends
    @friend = Friend.new
  end
  def create
    @friend = Friend.new(friend_create_param)
    @friend.request_user_id = current_user.id
    if Friend.find_by(target_user_id: @friend.target_user_id,
      request_user_id: @friend.request_user_id)
    else
      @friend.save
    end
    redirect_to request.referrer
  end
  def destroy
    req = Friend.find_by(request_user_id: params[:id])
    tgt = Friend.find_by(target_user_id: params[:id])
    req.destroy if req
    tgt.destroy if tgt
    redirect_to request.referrer
  end
  
  private
  def friend_create_param
    params.require(:friend).permit(:target_user_id)
  end
end
