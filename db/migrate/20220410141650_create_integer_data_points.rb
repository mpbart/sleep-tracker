class CreateIntegerDataPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :integer_data_points do |t|
      t.integer :value
      t.string :name
      t.integer :sleep_quality_id

      t.timestamps
    end
  end
end
