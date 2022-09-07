module CsvImportable
  extend ActiveSupport::Concern

  class_methods do
    def import_from_csv(file_path:, columns:)
      records = []

      CSV.foreach(file_path, headers: true).each do |row|
        attributes = row.to_h.slice(*columns)
        records << create!(attributes)
      end

      records
    end
  end
end
