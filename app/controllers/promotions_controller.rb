class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @promotions = Promotion.paginate(:page => params[:page], :per_page => 10)
    .order("due_date DESC")
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
  end

  # POST /promotions
  # POST /promotions.json
  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      vendors_importer = VendorsExcelImporter.new(params[:promotion][:file], @promotion)
      vendors_importer.import
      if vendors_importer.errors.empty?
        redirect_to @promotion, notice: 'Promotion was successfully created.'
      else
        vendors_importer.errors.each do |error|
          @promotion.errors.add :vendors, error
        end
        render :new
      end
    else
      render :new
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    if @promotion.update(promotion_params)
      vendors_importer = VendorsExcelImporter.new(params[:promotion][:file], @promotion)
      begin
        vendors_importer.import
      rescue Exceptions::InvalidVendorsImport

      end
      if params[:promotion][:file_photo]
        @promotion.promotion_photos.create(photo: params[:promotion][:file_photo])
      end
      
      if vendors_importer.errors.empty?
        redirect_to @promotion, notice: 'Promotion was successfully updated.'
      else
        vendors_importer.errors.each do |error|
          @promotion.errors.add :vendors, error
        end
        render :edit
      end
    else
      render :edit
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'Promotion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def import_vendors

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:title, :description, :due_date,
        promotion_photos_attributes: [:id, :photo, :_destroy])
    end
  end
