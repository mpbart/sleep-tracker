class CreateBooleanDataPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :boolean_data_points do |t|
      t.boolean :value
      t.string :name
      t.integer :sleep_quality_id

      t.timestamps
    end

    add_foreign_key :boolean_data_points, :sleep_qualities
  end
end
