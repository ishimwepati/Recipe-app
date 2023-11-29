class PrivateRecipesController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipes = current_user.recipes.where(public: false)
  end

  def show
    @recipe = current_user.recipes.find_by(id: params[:id])

    if @recipe
      # Show the recipe details
    else
      redirect_to recipes_path, alert: "You don't have permission to view this recipe."
    end
  end
end
