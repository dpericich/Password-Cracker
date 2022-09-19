class CreateUserResearch < ActiveRecord::Migration[7.0]
  def change
    create_table :user_research do |t|
      t.string :username, null: false
      t.string :service, null: false
      t.integer :word_index, default: 0
      t.datetime :last_login
      t.string :successful_email 

      t.timestamps
    end
  end
end
