class CreateSubscribers < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribers do |t|
      t.references :order,         null: false, foreign_key: true
      t.string     :postal_code,  null: false
      t.integer    :region_id,    null: false
      t.string     :city,         null: false
      t.string     :street,       null: false
      t.string     :building_name
      t.string     :phone,        null: false
      t.timestamps
    end
  end
end
