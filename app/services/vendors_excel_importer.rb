class VendorsExcelImporter

  attr_reader :errors

  def initialize(file, promotion)
    @file = file
    @promotion = promotion
    @errors = []
    @vendors = []
  end

  def import
    if @file.nil?
      return
    end
    process_file
    if @vendors.map(&:valid?).all?
      @promotion.vendors.destroy_all
      @promotion.vendors.append(@vendors)
    else
      @vendors.each_with_index do |vendor, index|
        vendor.errors.full_messages.each do |message|
          @errors << "Row #{index+2}: #{message}"
        end
      end
    end
  end

  private

  def process_file
    spreadsheet = open_spreadsheet
    (2..spreadsheet.last_row).each do |i|
      row_data = Hash[[Vendor.excel_columns, spreadsheet.row(i)].transpose]
      row_data.merge!(promotion: @promotion)
      @vendors << Vendor.new(row_data)
    end
  end

  def open_spreadsheet
    return nil if @file.nil?
    case File.extname(@file.original_filename)
    when ".xls"
      Roo::Excel.new(@file.path)
    when ".xlsx"
      Roo::Excelx.new(@file.path)
    else
      @errors << "Unknown file type: #{@file.original_filename}"
    end
  end
end
