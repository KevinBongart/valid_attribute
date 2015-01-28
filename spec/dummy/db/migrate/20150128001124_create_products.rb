class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :company, index: true
      t.string :name
      t.string :legacy_code

      t.timestamps null: false
    end
    add_foreign_key :products, :companies
  end
end
