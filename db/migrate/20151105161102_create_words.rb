class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :name
      t.text :definition
      t.text :sample_sentence

      t.timestamps null: false
    end
  end
end
