class VendorsController < ApplicationController
  before_action :set_vendors
  before_action :set_vendor, only: [:show, :edit, :update, :destroy]

  # GET promotions/1/vendors
  def index
    @vendors = @promotion.vendors
  end

  # GET promotions/1/vendors/1
  def show
  end

  # GET promotions/1/vendors/new
  def new
    @vendor = @promotion.vendors.build
  end

  # GET promotions/1/vendors/1/edit
  def edit
  end

  # POST promotions/1/vendors
  def create
    @vendor = @promotion.vendors.build(vendor_params)

    if @vendor.save
      redirect_to(promotion_vendors_url(@promotion), notice: 'Vendor was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT promotions/1/vendors/1
  def update
    if @vendor.update_attributes(vendor_params)
      redirect_to([@vendor.promotion, @vendor], notice: 'Vendor was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE promotions/1/vendors/1
  def destroy
    @vendor.destroy

    redirect_to promotion_vendors_url(@promotion)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendors
      @promotion = Promotion.find(params[:promotion_id])
    end

    def set_vendor
      @vendor = @promotion.vendors.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def vendor_params
      params.require(:vendor).permit(:name, :vendor_type, :phone_number, :mobile_number, :governorate, :address, :lat, :lng)
    end
end
