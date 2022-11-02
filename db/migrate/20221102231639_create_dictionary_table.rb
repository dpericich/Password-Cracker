class CreateDictionaryTable < ActiveRecord::Migration[7.0]
  def change
    create_table :dictionaries do |t|
      t.string :terms, null: false
      t.timestamps
    end
  end
end
