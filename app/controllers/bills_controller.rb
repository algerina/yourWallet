class BillsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_bill, only: %i[ show edit update destroy ]

  # GET /bills or /bills.json
  def index
    @bills = Bill.where(author: current_user)
    @category_bills = Category.find(params[:category_id]).category_bills.order(created_at: :desc)
  end

  # GET /bills/new
  def new
    @bill = Bill.new
    @categories = Category.where(author: current_user)
  end

  # POST /bills or /bills.json
  def create
    @bill = Bill.new(bill_params)
    @bill.author = current_user
    respond_to do |format|
      if @bill.save
        format.html { redirect_to category_bills_path(@bill), notice: "Transaction was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bill
      @bill = Bill.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bill_params
      params.require(:bill).permit(:name, :amount)
    end
end
