class CatsController < ApplicationController
  def index
    @cats =  Cat.all()
      render :json => @cats
  end

  def show
    @cat = Cat.find(params[:id])
    render :json => @cat
  end

  def create
    @cat = Cat.create(cat_params)
    render :json => @cat
  end

  def update
    @cat = Cat.find(params[:id])
    if @cat.update_attributes(cat_params)
      render :json => @cat
    else
      render :json => {status: :update_failed}
    end
  end

  def destroy
    cat = Cat.find(params[:id])
    if cat.destroy!
      render :json => {status: :success}
    else
      render :json => {status: :delete_failed}
    end
  end


  private

  def cat_params
    params.require(:cat).permit([:name])
  end
end
