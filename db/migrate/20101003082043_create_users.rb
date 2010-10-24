class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :twitter_id
      t.string :name
      t.string :screen_name
      t.string :location
      t.string :timezone
      t.text :description
      t.string :url
      t.string :profile_image_url
      t.string :lang
      t.integer :friends_count
      t.integer :statuses_count
      t.integer :follwers_count
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
