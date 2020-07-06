class CreateCareRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :care_requests do |t|
      t.integer :status, default: 0, null: false, index: true
      t.references :patient, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
