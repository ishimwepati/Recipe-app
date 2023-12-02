class FoodsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Failed to delete this food item because it is being used by other users.'
  end

  def index
    @foods = Food.all.includes([:ingredients]).order(created_at: :desc)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user = current_user
    if @food.save
      flash[:notice] = 'New Food is added to the list!'
      redirect_to foods_path
    else
      flash[:notice] = @food.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @ingredients = @food.ingredients.includes([:recipes])
    @ingredients.destroy_all
    @food.destroy
    redirect_to foods_path
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurment_unit, :price, :quantity)
  end
end
