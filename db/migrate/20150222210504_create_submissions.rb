class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.timestamp :time
      t.date :date
      t.integer :user
      t.text :url
      t.text :description

      t.timestamps null: false
    end
  end
end
