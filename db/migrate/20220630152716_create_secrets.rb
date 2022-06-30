class CreateSecrets < ActiveRecord::Migration[7.0]
  def change
    create_table :secrets do |t|
      t.jsonb :configuration

      t.timestamps
    end
  end
end
