class AddIdToBlogPost < ActiveRecord::Migration[5.2]
  def change
  	add_column :blog_posts, :blogpost_id, :integer
  end
end
