class CreateUsersTable < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :status
      t.integer :current_dictionary_index, default: 0
      t.timestamps
    end

    add_reference :users, :service, index: true
    add_reference :users, :dictionary, index: true
  end
end
