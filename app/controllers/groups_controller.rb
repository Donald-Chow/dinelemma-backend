class GroupsController < ApplicationController
  before_action :set_group, except: %i[create index]

  def index
    @groups = policy_scope(Groups)

    render json: {
      status: :ok,
      data: @groups
    }
  end

  def show
    authorize @group

    render json: {
      status: :ok,
      data: @group
    }
  end

  def create
    @group = Group.new(group_params)
    authorize @group
    if @group.save
      GroupMember.create(user: current_user, group: @group, admin: true)
      render json: {
        status: { code: 200, message: "Group Created" },
        data: @group
      }
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @group

    if @group.update(group_params)
      render json: {
        status: { code: 200, message: "Group Updated" },
        data: @group
      }
    else
      render json: { errors: @group.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @group

    if @group.destroy
      render json: {
        status: { code: 200, message: "Group Destroyed" }
        # redirect?
      }
    else
      render json: {
        errors:
      }, status: :unprocessable_entity
    end
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

  def set_group
    @group = Group.find(params[:id])
  end
end
