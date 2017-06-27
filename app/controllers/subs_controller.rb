class SubsController < ApplicationController

  before_action :require_mod, only: [:edit, :update]
  before_action :require_logged_in, only: [:new, :create]

  def index
    @subs = Sub.all
  end

  def new
    @sub = Sub.new
  end

  def edit
    @sub = Sub.find(params[:id])
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.mod_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def update
    @sub = Sub.find(params[:id])
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def require_mod
    unless self.mod_id == current_user.id
      flash[:errors] = ['Only mods can edit subs']
      render :index
    end
  end
end
