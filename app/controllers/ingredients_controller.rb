class IngredientsController < ApplicationController
    before_action :set_ingredient, only: [:edit, :show]
    
    def new
        @ingredient = Ingredient.new
    end 

    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient          
        else
            render :new
        end
    end 

    def edit
    end

    def update
        set_ingredient
        @ingredient.update(ingredient_params)
        if @ingredient.save
            redirect_to @ingredient       
        else
            render :edit            
        end
    end

    def show 
    end 

    private

    def set_ingredient
        @ingredient = Ingredient.find(params[:id])
    end

    def ingredient_params 
        params.require(:ingredient).permit(:name)
    end

end