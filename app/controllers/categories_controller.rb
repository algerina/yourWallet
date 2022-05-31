class CategoriesController < ApplicationController
  before_action :set_category, only: %i[ show edit update destroy ]

  # GET /categories or /categories.json
  def index
    @categories = current_user.categories
  end

  # GET /categories/new
  def new
    @category = Category.new
  end


  # POST /categories or /categories.json
  def create
    @category = current_user.Category.new(category_params)

    respond_to do |format|
      if @category.save
        redirect_to groups_path, notice: 'Category has been created!'
      else
        flash[:alert] = 'Something went wrong, Try again!'
      render :new
      end
    end
  end


  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:name, :icon)
    end
end
