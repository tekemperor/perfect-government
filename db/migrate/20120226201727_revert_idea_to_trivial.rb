class RevertIdeaToTrivial < ActiveRecord::Migration
  def self.up
    remove_column :ideas, :content
    remove_column :ideas, :user_id
  end

  def self.down
    add_column :ideas, :content, :text
    add_column :ideas, :user_id, :integer
  end
end
