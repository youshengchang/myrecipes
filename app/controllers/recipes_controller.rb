class RecipesController < ApplicationController
    
    def index
        @recipes = Recipe.all
    end
    
    def show
        @recipe = Recipe.find(params[:id])
    end
    
    def new
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef = Chef.first
        if @reciep.save
            flash[:success] = "You new recipe is saved successfully!"
            redirect_to recipes_path
        else
            render :new
        end
    end
    
    def edit
        @recipe = Recipe.find(params[:id])
    end
    
    def update
        @recipe = Recipe.find(params[:id])
        if @recipe.update(recipe_params)
            flash[:success] = "You recipe is updated successfully!"
            redirect_to recipe_path
        else
            render :edit
        end
        
    end
    
    private
        
        def recipe_params
            params.require(:recipe).permit(:name, :summary, :description)
        end
end