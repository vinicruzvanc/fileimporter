class FileImportService

    require 'csv'

    def initialize(file)
      @file = file
    end

    def import
      if @file.original_filename.end_with?('.csv')
        CSV.foreach(@file.path, col_sep: "\t", headers: true) do |row|
          columns = row.to_s.split("\t")

          purchaser_name = columns[0]
          item_description = columns[1]
          item_price = columns[2].to_f
          purchase_count = columns[3].to_i
          merchant_address = columns[4]
          merchant_name = columns[5]

          newTotalIncomeCSV = item_price * purchase_count

          importCSV = Purchaser.new(
            purchaser_name: purchaser_name,
            item_description: item_description,
            item_price: item_price,
            purchase_count: purchase_count,
            total_income: newTotalIncomeCSV,
            merchant_address: merchant_address,
            merchant_name: merchant_name
          )

          importCSV.save
        end
        else
          File.open(@file.path, 'r').each_line.with_index do |line, index|
            #Skip nome da coluna TXT
            if index.zero?
              next
            end
            data = line.strip.split("\t")
            purchaser_name = data[0]
            item_description = data[1]
            item_price = data[2].to_f
            purchase_count = data[3].to_i
            merchant_address = data[4]
            merchant_name = data[5]

            newTotalIncomeText = item_price * purchase_count

            importText = Purchaser.new(
              purchaser_name: purchaser_name,
              item_description: item_description,
              item_price: item_price,
              purchase_count: purchase_count,
              total_income: newTotalIncomeText,
              merchant_address: merchant_address,
              merchant_name: merchant_name
            )

            importText.save
        end
      end
    end
end
