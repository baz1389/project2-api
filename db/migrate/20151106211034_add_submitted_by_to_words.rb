class AddSubmittedByToWords < ActiveRecord::Migration
  def change
    add_column :words, :submitted_by, :integer
  end
end
