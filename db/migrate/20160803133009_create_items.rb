class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.float :quantity
      t.integer :unit_price_in_cents
      t.integer :total_in_cents
      t.integer :invoice_id

      t.timestamps null: false
    end
  end
end
