class CreateUserfbs < ActiveRecord::Migration
  def change
    create_table :userfbs do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :image
      t.string :token
      t.datetime :expires_at

      t.timestamps null: false
    end
  end
end
