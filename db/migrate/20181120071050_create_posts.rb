class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :content
      t.integer :status
      t.integer :priority
      t.reference :user
      t.integer :deadline

      t.timestamps
    end
  end
end
