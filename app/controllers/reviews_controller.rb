class ReviewsController < ApplicationController
    
    before_action :set_current_recipe
    before_action :require_user, except: [:index]
    before_action :admin_user, only: :destroy
    
    def index
       # @reviews = Review.paginate(page: params[:page], per_page: 2)
       @reviews = Review.find_by(recipe_id: params[:id])
       
    end
    
    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(review_params)
        @review.chef = current_user
        @review.recipe = @current_recipe
        
        if @review.save
            flash[:success] = "Your review has been saved succesfully"
            redirect_to recipe_path(@current_recipe)
        else
            flash[:danger] = "Your review is not saved"
            render 'new'
        end
    end
    
    private 
    
    def review_params
        params.require(:review).permit(:title, :body)
    end
    
    def set_current_recipe
        @current_recipe = Recipe.find(params[:id])
    end
       
end
