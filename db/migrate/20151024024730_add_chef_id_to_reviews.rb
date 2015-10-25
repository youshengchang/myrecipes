class AddChefIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :chef_id, :integer
  end
end
