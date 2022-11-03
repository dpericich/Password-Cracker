class AddFieldsToServicesTable < ActiveRecord::Migration[7.0]
  def change
    change_table :services do |t|
      t.integer :rate_limit_per_hour
      t.string :blocked_ip_origins # this will be an array
      t.integer :failed_attempts_per_hour
    end
  end
end
