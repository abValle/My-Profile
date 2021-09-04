class AddVotesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :votes, :integer, default: 0
  end
end
