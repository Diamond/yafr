class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.text :body
      t.datetime :published
      t.boolean :read
      t.integer :feed_id

      t.timestamps
    end
  end
end
