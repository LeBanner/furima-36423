class CreateTransports < ActiveRecord::Migration[6.0]
  def change
    create_table :transports do |t|
      t.string     :post,        null: false
      t.integer    :prefecture,      null: false
      t.string     :city,               null: false
      t.string     :address,            null: false
      t.string     :building
      t.string     :phone,              null: false
      t.references :purchase,           null: false, foreign_key: true
      t.timestamps
    end
  end
end
