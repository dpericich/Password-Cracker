class CreateServicesTable < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :service_name
      t.string :base_url
      t.integer :attempts_before_account_freeze
      t.integer :attempts_before_backoff
      t.integer :duration_of_backoff

      t.timestamps
    end
  end
end
