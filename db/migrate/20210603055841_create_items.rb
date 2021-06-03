class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.references :user ,               null: false, foreign_key: true
      t.string     :product_name ,       null: false 
      t.text       :product_descrip ,    null: false 
      t.integer    :product_status_id ,  null: false 
      t.integer    :shipping_charge_id , null: false
      t.integer    :region_id ,          null: false
      t.integer    :shipping_period_id , null: false
      t.integer    :category_id ,        null: false
      t.integer    :price ,              null: false
      t.timestamps
    end
  end
end
