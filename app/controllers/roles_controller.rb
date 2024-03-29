class RolesController < ApplicationController
  before_action :authenticate_user!
  def new
    @role = Role.new
    gon.ProcessTypes = ProcessTypes
    gon.Args = ARGS
    gon.Args[:piece] = PieceDefinition.all.map{|pi| pi.name }
  end

  def create
    role = current_user.roles.new(role_params)
    cond = Condition.build_all(params[:condition])
    if role.valid? && cond.valid?
      cond.save_all
      role.condition_id = cond.id
      role.save
      redirect_to role_path(role), notice: "保存に成功しました。"
    else
      redirect_to new_role_path, alert: "保存に失敗しました。"
    end
  end

  def index
    @roles = User.find(params[:id]).roles
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit
    @role = Role.find(params[:id])
    gon.ProcessTypes = ProcessTypes
    gon.Args = ARGS
    gon.condition = @role.condition.to_hash

  end

  def update
    role = Role.find(params[:id])
    if(role.user == current_user)
      cond = Condition.build_all(params[:condition])
      if cond.valid?
        if role.condition_id
          role.condition.destroy_all
        end
        cond.save
        role.condition_id = cond.id
        role.update(role_params)
        redirect_to role_path(role), notice: "役を正常に更新しました。"
      else
        redirect_to edit_role_path(role), alert: "役の保存に失敗しました。"
      end
    else
      redirect_to request.referer, alert: "ほかのユーザーの役は削除できません。"
    end
  end

  def destroy
    role = Role.find(params[:id])
    if role.user_id
      if role.user == current_user
        role.condition.destroy_all
        role.destroy
        redirect_to user_roles_path(current_user), notice: "役を正常に削除しました。"
      else
        redirect_to request.referer, alert: "ほかのユーザーの役は削除できません。"
      end
    else
      redirect_to request.referer, alert: "プリセットの役は削除できません。"
    end
  end

  def copy_edit
    org = Role.find(params[:id])
    role = org.dup
    # update user
    role.user_id = current_user.id
    # dup condition
    cond = org.condition.deep_dup
    cond.save
    role.condition_id = cond.id
    # save
    role.save
    redirect_to edit_role_path(role)
  end

  private
  def role_params
    params.require(:role).permit(:name, :kana, :faan,
      :score_down_type, :outline, :comment)
  end
end
