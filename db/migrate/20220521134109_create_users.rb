class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :hashed_pin

      t.timestamps
    end

    add_reference :sleep_qualities, :user, foreign_key: true
  end
end
