class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.string :author
      t.string :image
       
      t.timestamps
    end
  end
end