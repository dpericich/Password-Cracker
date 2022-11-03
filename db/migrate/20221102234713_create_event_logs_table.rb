class CreateEventLogsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :event_logs do |t|
      t.string :status
      t.timestamps
    end

    add_reference :event_logs, :user, index: true
    add_reference :event_logs, :service, index: true
  end
end
