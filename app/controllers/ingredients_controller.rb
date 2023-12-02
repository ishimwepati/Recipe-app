class IngredientsController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def new
    # @foods = Food.all.order(created_at: :desc)
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.where.not(id: Ingredient.where(recipe_id: @recipe.id).pluck(:food_id))

    @ingredient = Ingredient.new
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)

    flash[:notice] = if @ingredient.save
                       'Ingredient created!'
                     else
                       @group.errors.full_messages.join(', ')
                     end
    @ingredient.food.update_quantity
    redirect_to request.referrer
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])

    flash[:notice] = if @ingredient.destroy
                       'Ingredient Removed!'
                     else
                       @ingredient.errors.full_messages.join(', ')
                     end
    @ingredient.food.update_quantity
    redirect_to request.referrer
  end

  def update
    @ingredient = Ingredient.find(params[:id])

    if @ingredient.update(quantity_param)
      flash[:notice] = 'Ingredient updated!'
      @ingredient.food.update_quantity
      redirect_to recipe_path(params[:recipe_id])
    else
      flash[:notice] = @ingredient.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:food_id, :recipe_id, :quantity)
  end

  def quantity_param
    params.require(:ingredient).permit(:quantity)
  end
end
