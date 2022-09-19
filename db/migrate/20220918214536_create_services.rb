class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :name
      t.string :url
      t.integer :try_before_lockout_count
      t.integer :attempt_backoff_minutes

      t.timestamps
    end
  end
end
