class AddReportingDocumentsProvidedAtToSellings < ActiveRecord::Migration[5.2]
  def change
    add_column :sellings, :reporting_documents_provided_at, :datetime
  end
end
