class BillsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills or /bills.json
  def index
    @category = current_category
  end

  # GET /bills/new
  def new
    @bill = Bill.new
  end

  # POST /bills or /bills.json
  def create
    @category = current_category
    @bill = current_user.bills.new(bill_params)
      if @bill.save
        redirect_to category_bills_path(@category)
      else
        render :new
      end
  end

  def current_category
    @categories = current_user.categories.includes(:bills).find(params[:category_id])
  end
  private

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:name, :amount, category_ids: [])
    end
end
