class CreateSleepQuality < ActiveRecord::Migration[7.0]
  def change
    create_table :sleep_qualities do |t|
      t.date :date
      t.integer :sleep_rating
      t.float :sleep_duration

      t.timestamps
    end
  end
end
