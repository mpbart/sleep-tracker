class CreateTimeDataPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :time_data_points do |t|
      t.datetime :value
      t.string :name
      t.integer :sleep_quality_id

      t.timestamps
    end
  end
end
