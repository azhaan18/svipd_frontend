class AddCredToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :product_title, :string
  end
end
