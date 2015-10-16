class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|

      t.string :title
      t.string :author
      t.datetime :published_at
      t.text :content
      t.string :source
      t.text :image
      t.text :url
      t.boolean :approved, default: true

      t.timestamps null: false
    end
  end
end
