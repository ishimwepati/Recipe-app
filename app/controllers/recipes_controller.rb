class RecipesController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |_exception|
    redirect_to root_path, notice: 'Access denied'
  end

  def index
    @recipes = Recipe.all.includes([:ingredients]).order(created_at: :desc)
  end

  def public_recipes
    @recipes = Recipe.where(public: true).order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(public_param)
    redirect_to request.referrer
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    if @recipe.save
      flash[:notice] = 'New Recipe is added to the list!'
      redirect_to recipes_path
    else
      flash[:notice] = @recipe.errors.full_messages.join(', ')
      redirect_to request.referrer
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @ingredients = @recipe.ingredients
    @ingredients.destroy_all
    @recipe.destroy
    redirect_to recipes_path
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def public_param
    params.require(:recipe).permit(:public)
  end
end
