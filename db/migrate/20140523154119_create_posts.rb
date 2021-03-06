class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :title, null: false
      t.text :subtitle, null: false
      t.text :body, null: false
      t.boolean :public, null: false
    end
  end
end