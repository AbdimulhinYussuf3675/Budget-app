class GroupsController < ApplicationController
  def index
    @categories = Group.all.where(user: current_user).includes(:operations)
  end

  def new
    @category = Group.new
  end

  def create
    @category = Group.new(category_params)
    @category.user = current_user
    if @category.save
      redirect_to group_url
      flash[:notice] = 'Categorie created successfully'
    else
      flash[:error] = "Can't be blank, record didn't get saved"
      render :new
    end
  end

  private

  def category_params
    params.require(:group).permit(:name, :icon)
  end
end
