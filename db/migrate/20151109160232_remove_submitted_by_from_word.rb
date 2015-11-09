class RemoveSubmittedByFromWord < ActiveRecord::Migration
  def change
    remove_column :words, :submitted_by, :integer
  end
end
