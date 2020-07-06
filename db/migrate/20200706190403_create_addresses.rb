class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :owner, polymorphic: true
      t.boolean :default, default: true
      t.string :line1, null: false
      t.string :line2
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.float :latitude
      t.float :longitude

      t.timestamps
    end

    add_index :addresses, %i[latitude longitude]
    add_index :addresses, %i[latitude longitude owner_id owner_type], name: :idx_lat_long_on_owner
  end
end
